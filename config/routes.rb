Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  ####### PROPERTY ##########
  get "/properties" => "properties#index"
  post "/properties" => "properties#create"
  get "/properties/:id" => "properties#show"
  patch "/properties/:id" => "properties#update"
  delete "/properties/:id" => "properties#destroy"

  ###### USER / SESSION ######
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  ####### BOOKING ###########
  post "/bookings" => "bookings#create"
  get "/bookings" => "bookings#index"
  patch "/bookings/:id" => "bookings#update"
  get "/property/bookings/:id" => "bookings#property_bookings"
end
