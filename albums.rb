require('pg')
require_relative('./db/sql_runner')
require_relative('artists')

class Albums

  attr_accessor :artist_id, :title, :genre
  attr_reader :id

  def initialize(options)
    @id = options['id'] unless options['id'].nil?
    @title = options['title']
    @genre = options['genre']
    # @artist_id = options['artist_id'].to_i
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

  def self.delete_all()
    db = PG.connect( { dbname: 'music', host: 'localhost' } )
    sql = "DELETE FROM albums;"
    db.exec(sql)
    db.close()
  end

  # def which()
  #   sql = "SELECT * from artists WHERE id = #{ @artist_id};"
  #   artist = SqlRunner.run( sql )[0]
  #   return Artist.new(artist)
  # end
  
end