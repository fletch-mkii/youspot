class Spotify

  require "httparty"

  BASE_QUERY = "https://api.spotify.com/v1/"

  def self.add_tracks(tracks_array, playlist)
    pl_id = playlist_id(playlist)
    id_tracklist = search_spotify(tracks_array, playlist)
    id_tracklist.each do |track|
      unless exists_in_playlist?(track,play_id)
        #add track to playlist query
        query = "users/{user_id}/playlists/{playlist_id}/tracks"
      end
    end
  end

  def self.search_spotify(tracks, playlist)
    track_id_list = []
    tracks.each do |track|
      query = "search?q=track:#{track[1]}%20artist:#{track[0]}&type=track"
      response = HTTParty.get(BASE_QUERY + query)
      parsed = response.parsed_response
      track_id = song_exists?(track, parsed)
      if track_id[0]
        track_id_list << track_id[1]
      else
        raise NoMatchError
      end
    end
    return track_id_list
  end

  def self.playlists
    query = "me"#/playlists&key=#{ENV["SPOTIFY_ID"]}"
    response = HTTParty.get(BASE_QUERY + query)
    parsed = response.parsed_response
  end

  def self.playlist_id(playlist_name)
    playlists()
    binding.pry
    query = "/v1/search?q=#{playlist_name}&type=playlist"
    response = HTTParty.get(BASE_QUERY + query)
    parsed = response.parsed_response
  end

  def self.exists_in_playlist?(track_id,playlist_id)
    #looks through youtube playlist one by one and checks if each song is already in the desired playlist
  end

  def self.song_exists?(track, spotify_response)
    parsed["tracks"]["items"].each do |result|
      if result["name"].downcase == track[1].downcase && result["artists"][0]["name"].downcase == track[0].downcase
        return [true, result["id"]]
      else
        return [false, nil]
      end
    end
  end
end

class NoMatchError < StandardError
  def initialize(msg="Song was not found on Spotify")
    super
  end
end
