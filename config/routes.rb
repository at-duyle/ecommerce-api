Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: %i[create destroy]
  resources :users do
    collection do
      get 'current'
    end
  end
  resources :categories, only: %i[index] do
    collection do
      post 'products'
    end
  end
  resources :shops, only: %i[index] do
    member do
      get 'products'
    end
  end
end
