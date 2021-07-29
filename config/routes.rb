Rails.application.routes.draw do
  resources :pets, only: [:index]

  post 'users/sign_up', to: 'users#sign_up'
  post 'users/sign_in', to: 'users#sign_in'
  # get 'users/sign_out', to: 'users#sign_out'
end
