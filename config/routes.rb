Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: "login", sign_out: "logout"}, controllers: { registrations: "user_registrations" }
  resources :products do
    resources :comments
  end
  resources :users
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  post 'simple_pages/thank_you'
  # root 'simple_pages#landing_page'
  root 'products#index'
  post 'payments/create'
  mount ActionCable.server => '/cable'
  
end