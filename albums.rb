require('pg')
require_relative('./db/sql_runner')

class Albums

  attr_accessor :title, :genre
  attr_reader :id

  def initialize(options)
    @id = options['id'] unless options['id'].nil?
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    db = PG.connect( { dbname: 'music', host: 'localhost' } )
    sql = 
    "
    INSERT INTO albums 
    (title, genre) 
    VALUES 
    ( '#{title}', '#{genre}')RETURNING *;
    "
    @id = db.exec(sql) [0] ['id'].to_i
    db.close()
  end

  def self.all()
    db = PG.connect( { dbname: 'music', host: 'localhost' } )
    sql = "SELECT * FROM albums;"
    albs = db.exec(sql)
    db.close()
    return albs.map { |albums| Albums.new(albums)}
  end
  
end