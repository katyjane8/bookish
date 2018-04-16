Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'
  get '/auth/goodreads', to: 'sessions#new'
  get '/auth/goodreads/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get '/bestsellers', to: 'bestsellers#index'
  get '/book/:id', to: 'book#show', as: 'book'
  get '/logout', to: 'sessions#destroy'
  resources :bookstores

  get '/dashboard', to: 'dashboard#index'
end
