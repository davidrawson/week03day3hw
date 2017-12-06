require_relative('../db/sql_runner')

class Album

  attr_reader :id, :album_title, :genre, :artist_id

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

end
