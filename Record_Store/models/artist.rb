require_relative('../db/sql_runner')
require_relative('./album.rb')

class Artist

  attr_reader :id, :name

  def initialize(options)

    @id = options['id'].to_i
    @name = options['name']

  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id;"
    values = [@name]
    artist = SqlRunner.run(sql, values).first
    @id = artist['id'].to_i
  end

  def update()
    sql = "UPDATE artists SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1;"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    result = albums.map{|album| Album.new(album)}
    return result
  end

  def self.search(term)
sql ="SELECT * FROM artists WHERE name LIKE $1;"
values = [@name, term]
answers = SqlRunner.run(sql, values)
result = answers.map{|answer| Artist.new(answer)}
return result

  end

  def self.find(id)
    sql = "SELECT * from artists WHERE id=$1;"
    values = [id]
    artist = SqlRunner.run(sql, values)
    result = Artist.new(artist.first)
    return result
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run( sql )
    result = artists.map { |artist| Artist.new(artist) }
    return result
  end

  def self.sort_all()
    sql = "SELECT * FROM artists ORDER BY name;"
    artists = SqlRunner.run( sql )
    result = artists.map { |artist| Artist.new(artist) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    values = []
    SqlRunner.run(sql, values)
  end





end
