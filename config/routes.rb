Rails.application.routes.draw do
  resources :pets, only: [:index]

  post 'authenticate', to: 'users#sign_in'
  post 'signup', to: 'users#sign_up'
end
