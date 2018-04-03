Rails.application.routes.draw do
  root to: 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy'

  get 'dashboard', to: 'dashboard#index'
end
