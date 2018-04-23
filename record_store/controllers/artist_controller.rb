require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )
require_relative("../models/album.rb")

get '/artist' do
  @artists = Artist.all()
  erb(:"artist/index")
end

get '/artist/new' do
@artists = Artist.all()
  erb(:"artist/new")
end

get '/artist/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb(:"artist/show")
end


post "/artist" do
new_artist = Artist.new(params)
new_artist.save()
redirect to "/"
end

post "/artist/:id/delete" do
  artist = Artist.find(params['id'].to_i)
  artist.delete()
  redirect to "/"
end
