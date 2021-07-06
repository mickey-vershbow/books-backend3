Rails.application.routes.draw do
  # resources create full crud routes/controllers associated with the :table. Notice in the :users resource, we specified that we only want a create route/function.
  resources :books
  resource :users, only: [:create]

  # nytimes api get route for current list
  get "/bestsellers", to: "bestsellers#current_list"
    # nytimes api get route for list from previous date
  get "/bestsellers/search", to: "bestsellers#search_list"
  # login route
  post "/login", to: "users#login"
  # test login route
  get "/auto_login", to: "users#auto_login"
end

# SYNTAX === post "/url_point", to: controller#function
