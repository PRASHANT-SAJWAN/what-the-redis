Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "fedis#index"
  get "/", to: "fedis#index"
  post "/add", to: "fedis#add"
  post "/remove", to: "fedis#remove"
end
