require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/album_controller')
require_relative('controllers/artist_controller')


get '/' do
  @artists = Artist.sort_all()

  erb( :index )
end
