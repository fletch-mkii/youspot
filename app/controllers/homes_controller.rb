class HomesController < ApplicationController

  def index
    ###YOUTUBE API STUFF###
    #Youtube get channel ID api call (beardbros)
    #returns channelId to be used in playlist call
    "https://www.googleapis.com/youtube/v3/channels?part=id&forUsername=ThatOneLaserClown&key=AIzaSyB7Q4RVmZ8elFrISN_esxw7jCZUsp7OprM"
    #Youtube baseline playlist api call (beardbros)
    "https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=UCl84oPPKuECe1PbIwDSN1Cg&key=AIzaSyB7Q4RVmZ8elFrISN_esxw7jCZUsp7OprM"



    ###SPOTIFY API STUFF###
    #Spotify track search, no extra specificity (muse - mercy)
    "https://api.spotify.com/v1/search?q=mercy&type=track"
    #Spotify artist search, no extra specificity (muse)
    "https://api.spotify.com/v1/search?q=muse&type=artist"

    #can compare track results to artist ID to find exact matches
      #might be slow and at least O(n) ontop of potentially 200 API calls for full playlists

    #still need to set up OAuth in order to add matches to a playlist

  end
end
