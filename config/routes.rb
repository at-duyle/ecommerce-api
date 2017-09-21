Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: %i[create destroy]
  
  resources :users do
    member do
      put 'password'
      patch 'password'
      put 'confirm_token'
      patch 'confirm_token'
    end
    resources :delivery_orders, only: %i[index create]
  end

  resources :categories, only: %i[index] do
    resources :products_category, only: %i[index]
  end

  resources :shops, only: %i[index show] do
    resources :products_shop, only: %i[index]
  end

  resources :products, only: %i[index show] do
    resources :comments, only: %i[create index]
    member do
      get 'check_quantity/:quantity', action: :check_quantity
      get 'check_permission', action: :check_permission
    end
  end
  
  resources :products_best_seller, only: %i[index]

  resources :products_newest, only: %i[index]

  resources :search, only: %i[index]

  resources :register_confirm, only: %i[update]

  resources :reset_password, only: %i[create update]

  resources :carts, only: %i[show create update destroy]

  resources :requests, only: %i[create]
end
