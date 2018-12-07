Rails.application.routes.draw do
  
  resources :stores
  resources :roles
  get 'home/index'
  devise_for :users

  root "home#index"

  get  'member/index'
  get  'member/create'
  post 'member/create_user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
