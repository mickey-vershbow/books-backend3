Rails.application.routes.draw do
  resource :users, only: [:create]
  # login route
  post "/login", to: "users#login"
  # test login route
  get "/auto_login", to: "users#auto_login"
end

# post "/url_point", to: controller#function
