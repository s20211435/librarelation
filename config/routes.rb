Rails.application.routes.draw do
  resources :requests do
    collection do
      get 'isbn_search'
      post 'isbn_search_process'
    end
  end
  resources :dealings
  resources :recommend_books
  resources :new_books
  resources :rankings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
