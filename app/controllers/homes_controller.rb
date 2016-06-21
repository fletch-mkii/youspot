class HomesController < ApplicationController

def index
end






















  def create
    render text: request.env['omniauth.auth'].to_json
  end
end

=begin
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
