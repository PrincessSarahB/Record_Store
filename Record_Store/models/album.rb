require_relative('../db/sql_runner')

class Album

  attr_reader :id, :title, :quantity, :genre, :artist_id, :url, :buy_price, :sell_price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @quantity = options['quantity'].to_i
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
    @url = options['url']
    @buy_price = options['buy_price'].to_f
    @sell_price = options['sell_price'].to_f
  end

  def save()
    sql = "INSERT INTO albums (title, quantity, genre, artist_id, url, buy_price, sell_price) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id;"
    values = [@title, @quantity, @genre, @artist_id, @url, @buy_price, @sell_price]
    album = SqlRunner.run(sql, values).first
    @id = album['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET (title, quantity, genre, artist_id, url, buy_price, sell_price) = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8;"
    values = [@title, @quantity, @genre, @artist_id, @url, @buy_price, @sell_price, @id]
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
  
  def margin()
    @margin = @sell_price - @buy_price
    return @margin
  end

  def profit()
    profit = margin() * @quantity
    return profit
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
