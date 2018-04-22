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

def self.find(id)
sql = "SELECT * FROM albums WHERE id = $1"
values = [id]
album = SqlRunner.run(sql, values)
result = Album.new(album.first)
return result
end

def self.find_album(artist_id)
sql = "SELECT * FROM albums WHERE artist_id = $1"
values = [artist_id]
result = SqlRunner.run(sql, values)
return result
end

def stock_level()
  return @quantity
  # if @quantity >= 10
  #   return "high"
  # elsif @quantity >= 5 && @quantity <= 9
  #   return "medium"
  # elsif @quantity <= 4
  #   return "low"
  # end

end

def self.all()
  sql = "SELECT * FROM albums"
  albums = SqlRunner.run( sql )
  result = albums.map { |album| Album.new(album) }
  return result
end

def self.delete_all()
    sql = "DELETE FROM albums"
    values = []
    SqlRunner.run(sql, values)
  end

end
