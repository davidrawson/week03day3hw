
require_relative('../db/sql_runner')

class Artist

  attr_accessor :artist_name
  attr_reader :id

  def initialize(options)
    @artist_name = options['artist_name']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO artists (artist_name)
    VALUES ($1) RETURNING id"
    result = SqlRunner.run(sql, [@artist_name])
    @id = result[0]['id'].to_i
  end

  def Artist.all()
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    return result.map{|artist| Artist.new(artist)}
  end

  def Artist.delete_all
    SqlRunner.run("DELETE FROM artists")
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id = $1;"
    album_hashes = SqlRunner.run(sql, [@id])
    return album_hashes.map{|album| Album.new(album)}
  end

  def update
    # SQL won't accept a single column name if it is in brackets. grrr.
    sql = "UPDATE artists SET artist_name = $1 WHERE id=$2"
    values = [@artist_name, @id]
    SqlRunner.run(sql, values)
  end

end
