class Session < ActiveRecord::Base

  require 'httparty'
  require "httpclient"
  require 'json'

  YOUTUBE_BASE_QUERY = "https://www.googleapis.com/youtube/v3/"
  SPOTIFY_BASE_QUERY = "https://api.spotify.com/v1/"

  def self.transfer_playlist(youtube_username,youtube_playlist,spotify_playlist)
    ch_id = find_channel_id(youtube_username)

    if playlist_exists?(ch_id)
      #begin searching playlist for matches on spotify
    end
  end

  private
  def self.find_channel_id(username)
    query = "channels?part=id&forUsername=#{username}&key=#{ENV['YOUTUBE_KEY']}"

    response = HTTPClient.new.get(YOUTUBE_BASE_QUERY + query)
    array_response = response.body.gsub(/\s+|\\|\"/, "").split(",")
    if array_response.length <= 5
      raise Exception
    else
      return array_response[-1][3..-4]
    end
  end

  def self.playlist_exists?(channel_id)
    query = "playlists?part=snippet&channelId=#{channel_id}&key=#{ENV['YOUTUBE_KEY']}&maxResults=50"

    response = HTTPClient.new.get(YOUTUBE_BASE_QUERY + query)
    json_response = JSON.parse(response)
    binding.pry
    #checks if playlist exists on specified youtube channel
  end

  def self.search_spotify_playlist
    #looks through youtube playlist one by one and checks if each song is on spotify
  end

  def self.parse_titles
    #normalizes format of youtube video titles to ensure artist/song are looked up properly
  end

  def self.song_exists?
    #checks if song exists on spotify
  end

  def self.add_track
    #adds track if it exists
  end
end



=begin
httpclient base response example from find_channel_id method
{}"{\n \"kind\": \"youtube#channelListResponse\",\n \"etag\": \"\\\"5g01s4-wS2b4VpScndqCYc5Y-8k/yRXaijMXb12z47BWtQ2z6odCmME\\\"\",\n \"pageInfo\": {\n  \"totalResults\": 1,\n  \"resultsPerPage\": 5\n },\n \"items\": [\n  {\n   \"kind\": \"youtube#channel\",\n   \"etag\": \"\\\"5g01s4-wS2b4VpScndqCYc5Y-8k/W1D1X7hgu1tWbH85X4IDQNduol0\\\"\",\n   \"id\": \"UCl84oPPKuECe1PbIwDSN1Cg\"\n  }\n ]\n}\n"


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
