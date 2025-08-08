# config/routes.rb
Rails.application.routes.draw do
  get "about/index"
  get "home/index"

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  get "/about", to: "about#index"

  post "/contact", to: "home#submit_contact", as: :contact
end

