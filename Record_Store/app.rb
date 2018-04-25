require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/album_controller')
require_relative('controllers/artist_controller')


get '/' do
  @artists = Artist.sort_all()
  erb( :index )
end


post '/search' do
  if params[:'query']
    @searches = Artist.search(params[:'query'])
  end
  erb(:"artist/search")
end
