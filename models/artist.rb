
require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :artist_name

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


end
