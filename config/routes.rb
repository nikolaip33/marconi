Rails.application.routes.draw do
  root 'sessions#home'

  get '/signup' => 'users#new'


  resources :reviews
  resources :podcasts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
