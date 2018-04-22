require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )

get '/artist' do
  @artists = Artist.all()
  erb ( :"artist/index" )
end

get '/artist/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb(:"artist/show")
end
