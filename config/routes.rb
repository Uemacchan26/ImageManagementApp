Rails.application.routes.draw do
  get 'images/index'
  get 'image/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
