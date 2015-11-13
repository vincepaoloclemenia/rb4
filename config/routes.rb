Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'pages#index'
  get 'dashboard' => 'pages#dashboard'
  resource :client, only: [:show, :edit, :update]
  resources :brands
  resources :branches
  resources :roles do
    get 'manage_permissions' => 'permissions#index'
    put 'manage_permissions' => 'permissions#update'
  end
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
