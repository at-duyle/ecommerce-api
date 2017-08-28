Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: %i[create destroy]
  
  resources :users do
    member do
      put 'password'
      patch 'password'
    end
    resources :orders, only: %i[index]
  end

  resources :categories, only: %i[index] do
    resources :products_category, only: %i[index]
  end

  resources :shops, only: %i[index] do
    resources :products_shop, only: %i[index]
  end

  resources :products, only: %i[index show]
  
  resources :products_best_seller, only: %i[index]

  resources :products_newest, only: %i[index]

  resources :search, only: %i[index]

end
