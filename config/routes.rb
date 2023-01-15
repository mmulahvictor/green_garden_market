Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products, only: [:index, :create, :show, :update, :destroy]
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :orders, only: [:index, :create, :show, :update, :destroy]
      resources :addresses, only: [:index, :create, :show, :update, :destroy]
      resources :reviews, only: [:index, :create, :show, :update, :destroy]
      resources :categories, only: [:index, :create, :show, :update, :destroy]
      resources :farmer, only: [:index, :create, :show, :update, :destroy]
      resources :payment, only: [:index, :create, :show, :update, :destroy]
      resources :inventory, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
