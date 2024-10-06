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
  get "/recipes/search/:query", to: "recipes#search"
  resources :ingredients
  resources :images
end
