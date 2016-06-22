class Session < ActiveRecord::Base

  #require "httpclient"

  YOUTUBE_BASE_QUERY = "https://www.googleapis.com/youtube/v3/"
  SPOTIFY_BASE_QUERY = "https://api.spotify.com/v1/"

  def find_channel_id(username)
    query = "channels?part=id&forUsername=#{username}&key=#{ENV[YOUTUBE_KEY]}"
  end

  def search_youtube_playlist
  end

  def song_exists?
  end

  def playlist_exists?
  end

  def search_spotify_playlist
  end

  def add_track
  end
end

=begin

###YOUTUBE API STUFF###
Youtube get channel ID api call (beardbros)
returns channelId to be used in playlist call
https://www.googleapis.com/youtube/v3/channels?part=id&forUsername=ThatOneLaserClown&key=AIzaSyB7Q4RVmZ8elFrISN_esxw7jCZUsp7OprM
Youtube baseline playlist api call (beardbros)
https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=UCl84oPPKuECe1PbIwDSN1Cg&key=AIzaSyB7Q4RVmZ8elFrISN_esxw7jCZUsp7OprM


###SPOTIFY API STUFF###
Spotify track search, no extra specificity (muse - mercy)
https://api.spotify.com/v1/search?q=mercy&type=track
Spotify artist search, no extra specificity (muse)
https://api.spotify.com/v1/search?q=muse&type=artist

can compare track results to artist ID to find exact matches
  might be slow and at least O(n) ontop of potentially 200 API calls for full playlists



find list of playlists for username
https://api.spotify.com/v1/users/{user_id}/playlists
check match for playlist name in input form

if match, use playlist name here to add track
https://api.spotify.com/v1/users/{user_id}/playlists/{playlist_id}/tracks


{"provider":"spotify"
"uid":"cogmer""info":{"name":"cogmer"
"nickname":"cogmer"
"email":null
"urls":{"spotify":"https://open.spotify.com/user/cogmer"}
"image":null}
"credentials":{"token":"BQAuFeUfUEI2omSgsUqiQ9sX00rD1dn472xrB6lzuIuL5dWB-iASjGGppFZ3HAw_xdPryRiiyP8CjF6-c2PplG5__OsrnMnLGArNU0_P1mNqXsn3NDNr-2ZZPhvaHH2II9ax4i79uzSyXQ_J2vglG0MqeIo_2Uxiu9qUAoJI_7N-mC8hFJXr4WfDJb_pw0D7gwTASCxOUQph0ZMqOw"
"refresh_token":"AQAqtGD5OkQn9dz8PPA9hdxiiCG1gytBompoId2oY97x0U21z8O5FmOqZGaIoe6beufz31MJ3PXmmexG_25Cl2QjpORnJBZ3c7vK7WeXUbOU6QmnIzVgFNWxX8Nfu7gZwic"
"expires_at":1466551727
"expires":true}
"extra":{"raw_info":{"display_name":null
"external_urls":{"spotify":"https://open.spotify.com/user/cogmer"}
"followers":{"href":null
"total":0}
"href":"https://api.spotify.com/v1/users/cogmer"
"id":"cogmer"
"images":[]
"type":"user"
"uri":"spotify:user:cogmer"}}}}
=end
