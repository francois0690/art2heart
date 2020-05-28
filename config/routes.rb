Rails.application.routes.draw do

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  unauthenticated do
    root to: 'pages#home'
  end

  authenticated do
    root to: 'users#dashboard', as: :authenticated_root
  end

  resources :transactions, except: [ :new, :create ]
  resources :pieces do
      resources :transactions, only: [ :new, :create ]
  end

end
