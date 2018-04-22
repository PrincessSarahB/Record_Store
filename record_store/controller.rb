require('sinatra')
require('sinatra/contrib/all')

require_relative("./models/album.rb")
require_relative("./models/artist.rb")

get "/album" do
@albums = Album.all
erb(:index)
end

get "/album/:id" do
  @album = Album.find(params[:id])
  @artists = Artist.all
  erb(:show)
end
