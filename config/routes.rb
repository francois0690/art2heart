Rails.application.routes.draw do
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
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
