Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  resources :company_users, controller: "users"
  root 'pages#index'
  get 'dashboard' => 'dashboard#index'
  get 'purchase_listings' => 'reports#purchase_listings'
  get 'purchase_summary' => 'reports#purchase_summary'
  get 'item_purchase_detail' => 'reports#item_purchase_detail'
  get 'price_movement_report' => 'reports#price_movement_report'
  get 'invoice_entry_report' => 'reports#invoice_entry_report'
  get 'update_item' => 'reports#update_item'
  get 'man_hours' => 'reports#man_hours'
  get 'profit_and_losses' => 'profit_and_losses#index'
  get 'settings' => 'settings#index'
  patch 'update_settings' => 'settings#update_settings'
  patch 'csrab' => 'settings#csrab'
  get 'account/:username' => 'users#account', as: 'account'
  patch 'account/:username/update_account' => 'users#update_account', as: 'update_account'
  patch 'account/:username/change_password' => 'users#change_password', as: 'change_password'
  resource :client, only: [:show, :edit, :update]
  resources :brands do
    resources :branches, only: [:create,:update,:destroy]
  end
  resources :roles do
    get 'manage_permissions' => 'permissions#index'
    put 'manage_permissions' => 'permissions#update'
  end
  resources :employees do
    get 'labor_hours' => 'employees#labor_hours'
  end
  resources :labor_hours do
    get 'work_hours_list' => 'labor_hours#work_hours_list'
  end
  resources :settlements
  resources :categories do
    get 'new_subcategory' =>'categories#new_subcategory'
  end
  resources :shifts, only: [:index,:create,:update,:destroy]
  resources :sales
  resources :units
  resources :items
  resources :inventories
  resources :employee_types
  resources :conversions
  resources :suppliers
  resources :manifolds
  resources :directionals
  resources :purchases do
    resources :purchase_items
  end
  resources :subscriptions
  resources :bills
  resources :payment_notifications
  post 'paypal_checkout' => 'subscriptions#paypal_checkout'
  get 'process_subscription' => 'subscriptions#process_subscription'
  delete 'subscription/:id/cancel', to: 'subscriptions#cancel', as: 'cancel_subscription'

  resource :wizard, only: [:show] do
    get 'user_setup' => 'wizards#user_setup'
    get 'company_setup' => 'wizards#company_setup'
    get 'brand_setup' => 'wizards#brand_setup'
    get 'branch_setup' => 'wizards#branch_setup'
    get 'setup_summary' => 'wizards#setup_summary'
    put 'user_setup_complete' => 'wizards#user_setup_complete'
    put 'company_setup_complete' => 'wizards#company_setup_complete'
    put 'brand_setup_complete' => 'wizards#brand_setup_complete'
    put 'branch_setup_complete' => 'wizards#branch_setup_complete'
    put 'setup_summary_complete' => 'wizards#setup_summary_complete'
  end

  get 'directionals/search' => 'directionals#search_entry'

  # ajax
  get 'update_role' => 'pages#update_role'
  get 'update_branch' => 'pages#update_branch'
  get 'update_units' => 'pages#update_units'
  get 'registration_validate_email' => 'pages#registration_validate_email'
  get 'registration_validate_username' => 'pages#registration_validate_username'
  put 'change_brand' => 'pages#change_brand'
  get 'get_plan_info' => 'pages#get_plan_info'
end
