class HomeController < ApplicationController
  def index
  end

  def submit_contact
    contact = contact_params.to_h
    Rails.logger.info "Contact form submitted: #{contact.inspect}"

    flash[:notice] = "Thanks for your message, #{contact['name'] || 'there'} — I'll get back to you soon!"
    redirect_to root_path(anchor: "contact")
  end

  private

  def contact_params
    params.permit(:name, :email, :phone, :message)
  end
end

