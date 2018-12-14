Rails.application.routes.draw do
  
  resources :lens
  
  resources :frames
  resources :products
  resources :employees
  resources :stores
  resources :roles
  get 'home/index'
  devise_for :users

  root "home#index"

  get  'member/index'
  get  'member/create'
  post 'member/create_user'

  get 'inventory/index'
  get 'inventory/barcode_generate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
