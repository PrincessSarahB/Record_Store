class Album

attr_reader :id
attr_accessor :title, :quantity, :genre, :artist_id
def initialize(options)

@id = options['id'].to_i
@title = options['title']
@quantity = options['quantity'].to_i
@genre = options['genre']
@artist_id = options['artist_id'].to_i

end




end
