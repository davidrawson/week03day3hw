require_relative('../db/sql_runner')

class Album

  attr_accessor :album_title, :genre, :artist_id
  attr_reader :id 

  def initialize(options)
    @album_title = options['album_title']
    @genre = options['genre']
    @artist_id = options['artist_id']
    @id = options['id'].to_i if options['id']
  end


  def save
    sql = "INSERT INTO albums (album_title, genre, artist_id)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@album_title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def Album.all
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    return result.map{|album| Album.new(album)}
  end

  def Album.delete_all
    SqlRunner.run("DELETE FROM albums")
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1;"
    result = SqlRunner.run(sql, [@artist_id])[0]
    return Artist.new(result)
  end

  def update
    sql = "UPDATE albums SET (album_title, genre, artist_id)
    =($1, $2, $3)"
    values = [@album_title, @genre, @artist_id]
    SqlRunner.run(sql, values)
  end

end
