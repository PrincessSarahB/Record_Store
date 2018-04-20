require_relative('../db/sql_runner')

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

def save()
  sql = "INSERT INTO albums (title, quantity, genre, artist_id) VALUES ($1, $2, $3, $4) RETURNING id;"
  values = [@title, @quantity, @genre, @artist_id]
  album = SqlRunner.run(sql, values).first
  @id = album['id'].to_i
end

def self.all()
  sql = "SELECT * FROM albums"
  albums = SqlRunner.run( sql )
  result = albums.map { |album| Album.new(album) }
  return result
end

end
