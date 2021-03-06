Rails.application.routes.draw do
  root 'sessions#home'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'


  resources :reviews
  resources :podcasts do
    resources :reviews
  end
  resources :podcasts do
    resources :episodes
  end
  resources :publishers
  resources :episodes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
