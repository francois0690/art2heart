Rails.application.routes.draw do
  get 'users/edit'
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'transactions/create'
  get 'transactions/destroy'
  get 'transactions/edit'
  get 'transactions/index'
  get 'transactions/new'
  get 'transactions/show'
  get 'transactions/update'
  get 'pieces/create'
  get 'pieces/destroy'
  get 'pieces/edit'
  get 'pieces/index'
  get 'pieces/new'
  get 'pieces/show'
  get 'pieces/update'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  unauthenticated do
    root to: 'pages#home'
  end

  authenticated do
    root to: 'users#dashboard', as: :authenticated_root
  end

  resources :users do
    resources :transactions, except: [ :new, :create ]
    resources :pieces do
        resources :transactions, only: [ :new, :create ]
    end
  end

end
