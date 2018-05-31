Rails.application.routes.draw do

  get 'item_cost_analysis_reports/index'

  devise_for :users, controllers: { registrations: "registrations", passwords: "passwords" }
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
  get 'account/:username' => 'users#account', as: 'account', :constraints => { :username => /[^\/]+(?=\.html\z|\.json\z)|[^\/]+/ }
  patch 'account/:username/update_account' => 'users#update_account', as: 'update_account'
  patch 'account/:username/change_password' => 'users#change_password', as: 'change_password'
  resource :client, only: [:show, :edit, :update]
  resources :brands do
    resources :branches
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
  resources :item_cost_analysis_reports
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
  resources :sale_reports, only: :show
  resources :purchases do
    resources :purchase_items
  end
  resources :subscriptions do
    get 'show_branches', on: :collection
    get 'subscribe', on: :collection
  end

  resources :purchase_order_generator, only: [:index, :new] do
    get :get_pos, on: :collection
  end
  resources :bills
  resources :payment_notifications
  post 'paypal_checkout' => 'subscriptions#paypal_checkout'
  get 'process_subscription' => 'subscriptions#process_subscription'
  delete 'subscription/:id/cancel', to: 'subscriptions#cancel', as: 'cancel_subscription'
  
  resources :purchase_orders_summary, only: :index
  resources :supplier_item_prices
  resources :order_per_suppliers
  resources :order_lists do
    get 'update_status' => 'order_lists#update_status'
  end
  resources :purchase_orders do
    resources :purchase_order_items do
      get :send_email, on: :collection
      get :approve_purchase_order, on: :collection
    end
    get :view_po_remotely, on: :collection
    get :send_bulk_purchase_orders, on: :collection
    get :group_of_purchase_orders, on: :collection
    post :mail_bulk_of_purchase_orders, on: :collection
    post 'send_email_notification' => 'purchase_orders#send_email_notification'
    patch 'approve' => 'purchase_orders#approve'
    patch 'hold' => 'purchase_orders#hold'
    patch 'reject' => 'purchase_orders#reject'
    get 'purchase_order' => 'purchase_orders#purchase_order'
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

  get 'directionals/search' => 'directionals#search_entry'

  # ajax
  get 'update_role' => 'pages#update_role'
  get 'update_branch' => 'pages#update_branch'
  get 'update_units' => 'pages#update_units'
  get 'update_price' => 'pages#update_price', as: 'price'
  get 'registration_validate_email' => 'pages#registration_validate_email'
  get 'registration_validate_username' => 'pages#registration_validate_username'
  get 'new_password_validate_email' => 'pages#new_password_validate_email'
  put 'change_brand' => 'pages#change_brand'
  get 'get_plan_info' => 'pages#get_plan_info'
  get 'get_price' => 'pages#get_price'
  get 'get_units' => 'pages#get_units'
  get 'take_units' => 'pages#take_units'
  

  namespace :api do
    resources :sales, only: :index do
      get :get_sales_averages, on: :collection
      get :get_customer_count, on: :collection
      get :get_average_revenues, on: :collection
    end

    resources :users, only: :index do
      get :users_per_branch, on: :collection
      get :users_per_brand, on: :collection
    end

    resources :purchase_order_summary, only: :index do
      get :get_purchase_orders, on: :collection
      get :get_on_hold_pos, on: :collection
      get :get_rejected_pos, on: :collection
    end

    resources :purchase_orders, only: :index do
      get :get_pos, on: :collection
    end

    resources :purchases, only: :index do
      get :searched_purchases, on: :collection
      get :export_excel, on: :collection
      get :default_excel, on: :collection
      get :purchased_items, on: :collection
    end

    resources :item_and_costs, only: [] do
      get :filtered_records, on: :collection
      get :this_month_for_brand_admin, on: :collection
      get :this_week_for_brand_admin, on: :collection
      get :this_month_for_branch_admin, on: :collection
      get :this_week_for_branch_admin, on: :collection
      get :filtered_records_for_brand, on: :collection
      get :filtered_records_for_branch, on: :collection
    end

    resources :items, only: :index

    resources :suppliers, only: [:create, :update]

    resources :activities, only: :index
    
    post "sale_reports" => "sale_reports#create"
    delete 'delete_picture' => 'users#delete_picture', as: :delete_avatar
    
  end
  
  resources :charts, only: [] do
    get :daily_sales, on: :collection
    get :sales_per_branch, on: :collection
    get :get_dates, on: :collection
    get :get_average, on: :collection
    get :get_dashboard_today, on: :collection
    get :customer_count, on: :collection
    get :yearly_sales, on: :collection
    get :today_sales_revenues_expenses, on: :collection
    get :generated_sale_report, on: :collection
    get :sales_vs_expense, on: :collection    
  end
end
