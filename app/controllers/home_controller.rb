class HomeController < ApplicationController
  def index
    private_project = {
      "name"        => "UpState (Private)",
      "description" => "NC's fastest and most accurate legislation tracker and committee transcript tool.",
      "url"         => "https://start.keepupstate.com/",
      "image_urls"  => [
        helpers.asset_path("advocacy-embed-description.png"),
        helpers.asset_path("advocacy-embed.png")
      ]
    }

    fetched = []
    begin
      resp = HTTParty.get("#{ENV['PY_API_URL']}/api/projects?limit=3")
      fetched = resp.success? ? resp.parsed_response : []
    rescue => e
      Rails.logger.error "Project fetch failed: #{e.message}"
    end

    @initial_projects = [private_project] + fetched
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
