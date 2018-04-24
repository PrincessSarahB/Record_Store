require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/album_controller')
require_relative('controllers/artist_controller')


get '/' do
  @artists = Artist.sort_all()

  erb( :index )
end

# get '/search' do
# @searches = Artist.all
# end

post '/search' do
# @searches = Artist.all
if params[:'query']
  @searches = Artist.search(params[:'query'])
# else
#   @searches = Artist.all
end
erb(:"artist/search")
end
