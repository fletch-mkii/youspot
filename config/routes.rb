Rails.application.routes.draw do
  root to: "homes#index"

  resources :sessions

  get '/auth/spotify/callback', to: 'sessions#create'
end
