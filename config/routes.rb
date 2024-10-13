Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "/users", to: "users#index"
  # get "/users/:id", to: "users#show"
  # post "/users", to: "users#create"
  # put "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"

  resources :cooks
  resources :categories
  post "/cooks/login", to: "cooks#login"
  resources :recipes
  get "/recipes/:id/full", to: "recipes#full_recipe_info"
  get "/recipes/:id/full_info", to: "recipes#full_info"
  get "/recipes/search_by_name/:query", to: "recipes#search_by_name"
  get "/recipes/search_by_ingredient/:query", to: "recipes#search_by_ingredient"
  get "/recipes/search_by_category/:query", to: "recipes#search_by_category"
  resources :ingredients
  resources :images
end
