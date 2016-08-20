Rails.application.routes.draw do
  
  root 'static_pages#home'

  resources :users
  resources :attractions

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  post '/rides' => 'rides#create'

end