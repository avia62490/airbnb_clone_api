Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  ####### HOUSE ##########
  get "/properties" => "properties#index"
  post "/properties" => "properties#create"
  get "/properties/:id" => "properties#show"
end
