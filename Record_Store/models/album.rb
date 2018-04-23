require_relative('../db/sql_runner')

class Album

  attr_reader :id, :title, :quantity, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @quantity = options['quantity'].to_i
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
    @url = options['url']
  end

  def save()
    sql = "INSERT INTO albums (title, quantity, genre, artist_id, url) VALUES ($1, $2, $3, $4, $5) RETURNING id;"
    values = [@title, @quantity, @genre, @artist_id, url]
    album = SqlRunner.run(sql, values).first
    @id = album['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET (title, quantity, genre, artist_id) = ($1, $2, $3, $4, $5) WHERE id = $6;"
    values = [@title, @quantity, @genre, @artist_id, @url, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums
    WHERE id = $1;"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artists = SqlRunner.run(sql, values)
    result = artists.map {|artist| Artist.new(artist)}
    return result
  end

  def stock_level()

    if @quantity >= 10
      return "high"
    elsif @quantity >= 5 && @quantity <= 9
      return "medium"
    elsif @quantity <= 4
      return "low"
    end

  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run( sql )
    result = albums.map { |album| Album.new(album) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    album = SqlRunner.run(sql, values)
    result = Album.new(album.first)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    values = []
    SqlRunner.run(sql, values)
  end

end
