Rails.application.routes.draw do
  resources :reviews, only:[:update,:create,:destroy,:index]
  resources :users
  resources :books, only:[:index]
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  delete "/reviews/:id", to: "reviews#destroy"


  
end
