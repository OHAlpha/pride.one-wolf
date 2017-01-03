Rails.application.routes.draw do
  get 'join', to: 'application#join'

  get 'application/signin'

  get 'application/signout'

  get 'application/leave'

  post 'access/name_exists'

  post 'access/email_exists'

  post 'access/generate_salt'

  post 'access/register'

  post 'access/primary_name'

  post 'access/client_salt'

  post 'access/login'

  post 'access/logout'

  post 'access/deregister'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
