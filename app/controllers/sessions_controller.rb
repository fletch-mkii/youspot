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
    tracklist = Youtube.transfer_playlist(session[:youtube_username],session[:youtube_playlist])
    response = HTTParty.post("https://accounts.spotify.com/api/token",
                            {'Authorization'=> 'Basic' + ENV["SPOTIFY_ID"] + ':' + ENV["SPOTIFY_SECRET"]})
    #parsed = response.parsed_response
    binding.pry
    Spotify.add_tracks(tracklist, session[:spotify_playlist])
    spot_hash = request.env['omniauth.auth'].to_hash
    spot_username = spot_hash["uid"]

    render text: spot_hash
    session.clear
  end
end
