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




end
