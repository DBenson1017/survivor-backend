Rails.application.routes.draw do
  resources :airs
  resources :locations
  resources :superfund
  resources :favorites
  namespace :api do 
    namespace :v1 do 
      resources :users
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/superfunds', to: 'superfund#index'
      post '/superfunds', to: 'superfund#create'
      end 
    end 
  end
    
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html