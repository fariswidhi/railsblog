
Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'dashboard/show'

  get 'welcome/index'
  get 'home/index'
  resources :articles  do
  	resources :comments
  end
 	get 'users/new'
 	get 'login', to: 'sessions#new'
 	get 'logout', to: 'sessions#destroy'
 	resources :sessions, only: [:create]
 	resources :users, only: [:new,:create]
  root 'home#index'
  get '/:id', to: 'home#detail', as: :detail
end