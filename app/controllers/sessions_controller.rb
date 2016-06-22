class SessionsController < ApplicationController

  def index
  end

  def new
    session[:youtube_username] = params["youtube_username"]
    session[:youtube_playlist] = params["youtube_playlist"]
    session[:spotify_playlist] = params["spotify_playlist"]
    redirect_to "/auth/spotify"
  end

  def create
    spot_hash = request.env['omniauth.auth'].to_hash
    spot_username = spot_hash["uid"]

    render text: spot_hash
    session.clear
  end
end
