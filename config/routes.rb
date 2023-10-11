Rails.application.routes.draw do
  resources :requests
  resources :recommend_books
  resources :new_books
  resources :rankings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
