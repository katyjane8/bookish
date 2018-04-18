Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'
  get '/auth/goodreads', to: 'sessions#new'
  get '/auth/goodreads/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get '/bestsellers', to: 'bestsellers#index'
  get '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#index'
  resources :favorites
    namespace 'api' do
      namespace 'v1' do
        resources :favorites
    end
  end
  resources :book
    namespace 'api' do
      namespace 'v1' do
        resources :book
    end
  end

end
