require_relative('../db/sql_runner')
require_relative('./album.rb')

class Artist

  attr_reader :id, :name

  def initialize(options)

    @id = options['id'].to_i
    @name = options['name']

  end

  #method to save artists
  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id;"
    values = [@name]
    artist = SqlRunner.run(sql, values).first
    @id = artist['id'].to_i
  end

  #method to update artists
  def update()
    sql = "UPDATE artists SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  #method to delete artist by id number
  def delete()
    sql = "DELETE FROM artists
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  #method to delete albums by artist id
  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1;"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    result = albums.map{|album| Album.new(album)}
    return result
  end

  #search for artists from database when search term is entered into the search box
  def self.search(term)
    sql = "SELECT * FROM artists WHERE name ILIKE '%#{term}%';"
    answers = SqlRunner.run(sql)
    result = answers.map{|answer| Artist.new(answer)}
    return result

  end

  #find artist by id number
  def self.find(id)
    sql = "SELECT * from artists WHERE id=$1;"
    values = [id]
    artist = SqlRunner.run(sql, values)
    result = Artist.new(artist.first)
    return result
  end

  #find all artists
  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run( sql )
    result = artists.map { |artist| Artist.new(artist) }
    return result
  end

  #sort artists in alphabetical order
  def self.sort_all()
    sql = "SELECT * FROM artists ORDER BY name;"
    artists = SqlRunner.run( sql )
    result = artists.map { |artist| Artist.new(artist) }
    return result
  end

  #delete all artists
  def self.delete_all()
    sql = "DELETE FROM artists"
    values = []
    SqlRunner.run(sql, values)
  end





end
