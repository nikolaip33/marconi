Rails.application.routes.draw do
  resources :publishers
  resources :episodes
  root 'sessions#home'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'


  resources :reviews
  resources :podcasts
  
  resources :publishers do
    resources :podcasts
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
