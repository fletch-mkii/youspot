Rails.application.routes.draw do
  root to: "homes#index"

  #get '/auth/twitter/callback', to: 'homes#index'
end
