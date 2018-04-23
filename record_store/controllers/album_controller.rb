require('sinatra')
require('sinatra/contrib/all')

require_relative("../models/album.rb")
require_relative("../models/artist.rb")

get "/album" do
@albums = Album.all
erb(:"album/index")
end

get "/album/new" do
@artists = Artist.all
erb(:new)
end

get "/album/:id" do
  @album = Album.find(params['id'].to_i)
  erb(:"album/show")
end
