Rails.application.routes.draw do
  # Health check endpoint
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  # Contact form submission
  post "/contact", to: "home#submit_contact", as: :contact

  # Projects API endpoint
  get "/projects.json", to: "home#projects_json"
end
