Rails.application.routes.draw do
  resources :images, only: [:index, :new, :create]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
