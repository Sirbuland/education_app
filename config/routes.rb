Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users, controllers: {
    sessions:       'users/sessions',
    registrations:  'users/registrations',
    confirmations:  'users/confirmations',
    passwords:      'users/passwords',
    invitations:    'users/invitations'
  }, sign_out_via: [:get, :delete]

  resources :users, only: [:edit, :update]
  resources :tutors
  resources :students
  resources :admin, only: [:index]
  resources :pending_applications, only: [:index, :update]
  resources :packages
  resources :credits
  resources :tags
  resources :categories
  resources :posts 
  get '/history', to: 'posts#history'
  get '/active', to: 'posts#active'
  post '/acceptapp', to: 'posts#acceptapp'
  post '/declineapp', to: 'posts#declineapp'
  get '/pending', to: 'tutors#pending'
  get '/editpost', to: 'tutors#editpost'
  post '/updatepost', to: 'tutors#updatepost'
  get '/declinedapplication', to: 'admin#declinedapplication'
end
