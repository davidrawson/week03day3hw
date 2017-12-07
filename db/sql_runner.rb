require ('pg')


class SqlRunner
# The idea is that whatever happens after the BEGIN Ruby will ENSURE
# that the close statement is executed. Fine error handling. 

  def SqlRunner.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'music_collection', host: 'localhost'})
      db.prepare('query', sql)
      result = db.exec_prepared('query', values)
    ensure
      db.close()
    end
    return result
  end

end
