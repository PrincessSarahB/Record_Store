require_relative('../db/sql_runner')

class Artist

attr_accessor :id, :name

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

def self.find_by_name(name)
sql = "SELECT * from artists WHERE name=$1;"
values = [name]
artists = SqlRunner.run(sql, values)
return artists.map {|artist| Artist.new(artist)}
end

def find_albums(title)
sql = "SELECT * FROM albums WHERE artist_id = $1 AND title = $2;"
values = [@id, title]
albums = SqlRunner.run(sql, values).first
return albums.map{|album| Album.new(album)}
end


  def self.all()
    sql = "SELECT * FROM artists"
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
