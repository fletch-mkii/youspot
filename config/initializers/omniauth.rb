Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify,
           ENV['SPOTIFY_ID'],
           ENV['SPOTIFY_SECRET'],
           scope: 'playlist-read-private playlist-modify-public user-library-read user-library-modify'
end
