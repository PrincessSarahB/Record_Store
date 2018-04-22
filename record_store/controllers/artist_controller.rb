require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )
require_relative("../models/album.rb")

get '/artist' do
  @artists = Artist.all()
  erb(:"artist/index")
end

get '/artist/:id' do
  @artist = Artist.find(params[:id])
  erb(:"artist/show")
end
