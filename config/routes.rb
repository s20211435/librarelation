Rails.application.routes.draw do
  get 'new_book_sub/show_page'
  get 'dealing/top'
  get 'home/main_top'
  get 'admin/top'
  resources :requests do
    collection do
      get 'isbn_search'
      post 'isbn_search_process'
    end
  end

  resources :dealings
  resources :recommend_books do
    collection do
      get 'isbn_search'
    end
  end
  resources :new_books do
    collection do
      get 'isbn_search'
    end
  end

  resources :rankings do
    collection do
      get 'isbn_search'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

