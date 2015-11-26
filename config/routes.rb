Rails.application.routes.draw do

  
  devise_for :users, controllers: { registrations: "registrations" }
  resources :company_users, controller: "users"
  get 'update_role' => 'pages#update_role'
  get 'update_branch' => 'pages#update_branch'
  root 'pages#index'
  get 'dashboard' => 'pages#dashboard'
  put 'change_brand' => 'pages#change_brand'
  resource :client, only: [:show, :edit, :update]
  resources :brands
  resources :branches
  resources :roles do
    get 'manage_permissions' => 'permissions#index'
    put 'manage_permissions' => 'permissions#update'
  end
  resources :employees do
    get 'labor_hours_list' => 'employees#labor_hours_list'
    get 'labor_hours' => 'employees#labor_hours'
  end
  resources :labor_hours
  resources :settlements
  resources :categories
  resources :labor_hours_entries
  resources :shifts, only: [:index,:create,:update,:destroy]
  resources :sales
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
end
