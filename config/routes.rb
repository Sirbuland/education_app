Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users, controllers: {
    sessions:       'users/sessions',
    registrations:  'users/registrations',
    confirmations:  'users/confirmations',
    passwords:      'users/passwords',
    invitations:    'users/invitations'
  }, sign_out_via: [:get, :delete]

  resources :users
  resources :tutors
  resources :students

end
