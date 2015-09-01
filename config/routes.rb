Rails.application.routes.draw do
	resources :admins
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'static_pages#home'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  # admin routes
  match '/admin_signup',  to: 'admins#new',                 via: 'get'
  match '/admin_signin',  to: 'admin_sessions#new',         via: 'get'
  match '/admin_signout', to: 'admin_sessions#destroy',     via: 'delete'
end
