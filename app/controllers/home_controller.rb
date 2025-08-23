class HomeController < ApplicationController
  def index
    begin
      resp = HTTParty.get("#{ENV['PY_API_URL']}/api/projects?limit=3")
      projects = resp.success? ? resp.parsed_response : []
    rescue => e
      Rails.logger.error "Project fetch failed: #{e.message}"
      projects = []
    end

    featured = ENV.fetch("FEATURED_PROJECT", "my-portfolio")
    @initial_projects = projects.select { |p| p["name"] == featured }
  end

  def submit_contact
    contact = contact_params.to_h
    Rails.logger.info "Contact form submitted: #{contact.inspect}"

    flash[:notice] = "Thanks for your message, #{contact['name'] || 'there'} — I'll get back to you soon!"
    redirect_to root_path(anchor: "contact")
  end

  def projects_json
    resp = HTTParty.get(ENV["PY_API_URL"] + "/api/projects")
    render json: (resp.success? ? resp.parsed_response : []), status: resp.code
  end

  private

  def contact_params
    params.permit(:name, :email, :phone, :message)
  end
end
