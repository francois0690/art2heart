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
  get 'profil', to: 'users#profil', as: 'profil'
  get 'my_pieces', to: 'pieces#my_pieces', as: 'my_pieces'

  patch 'profil/users_id', to: 'users#update_avatar', as: :update_avatar

end
