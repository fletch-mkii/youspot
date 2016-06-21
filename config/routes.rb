Rails.application.routes.draw do
  root to: "homes#index"

  get '/auth/spotify/callback', to: 'homes#create'
end
