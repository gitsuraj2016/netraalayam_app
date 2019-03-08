Rails.application.routes.draw do
  
  
  
  resources :lens
  resources :sunglasses
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
  post 'inventory/generate_barcode'
  get 'inventory/get_frame_data'

  get 'customer/index'
  get 'customer/create'
  get 'customer/edit'
  post 'customer/create_customer'

  get 'invoices/get_cust_data'
  get 'invoices/get_item_product'
  get 'invoices/edit'
  post 'invoices/generate_cust_invoice'

  get 'report/show_order_data'
  get 'report/index'
  get 'report/csv'
  get 'report/excel'




  resources :invoices, except: [:destroy] do
    collection do
      match 'search' => 'invoices#search', via: [:get, :post], as: :search
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
