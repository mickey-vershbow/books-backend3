Rails.application.routes.draw do
  # resources create full crud routes/controllers associated with the :table. Notice in the :users resource, we specified that we only want a create route/function.
  resources :books
  resource :users, only: [:create]

  # nytimes api get route for current list
  get "/bestsellers", to: "bestsellers#current_list"
  # nytimes api get route for current list date properties
  get "/bestsellers/date/current", to: "bestsellers#display_current_list_date"

  get "/bestsellers/archive/:date", to: "bestsellers#display_archive_list_date"

  # nytimes api get route for books list from previous date
  get "/bestsellers/:date", to: "bestsellers#date_search"

  # get route for :date properties from previous date
  # get "/bestsellers/:date", to: "bestsellers#display_archive_list_date"


  # login route
  post "/login", to: "users#login"
  # test login route
  get "/auto_login", to: "users#auto_login"
end

# SYNTAX === post "/url_point", to: controller#function
