Rails.application.routes.draw do
  resources :pets

  put 'pets/:id/update_status', to: 'pets#update_status'
  post 'users/sign_up', to: 'users#sign_up'
  post 'users/sign_in', to: 'users#sign_in'
  get 'users/sign_out', to: 'users#sign_out'
  get 'users/profile', to: 'users#profile'
end
