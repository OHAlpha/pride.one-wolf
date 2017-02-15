Rails.application.routes.draw do
  root 'application#root'
  get 'join', to: 'application#join'
  get 'signin', to: 'application#signin'
  get 'signout', to: 'application#signout'
  get 'leave', to: 'application#leave'
  get 'welcome', to: 'application#welcome'
  get 'dashboard', to: 'application#dashboard'
  get 'settings', to: 'application#settings'

  post 'access/name_exists'
  post 'access/email_exists'
  post 'access/generate_salt'
  post 'access/register'
  post 'access/user_data'
  post 'access/login'
  post 'access/logout'
  post 'access/deregister'
end
