require('pg')
require_relative('./db/sql_runner')

class Albums

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options['id'] unless options['id'].nil?
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums 
    (title, genre, artist_id) 
    VALUES (
    '#{title}',
    '#{genre}',
    '#{artist_id}'
      )RETURNING *;
    "
    order = SqlRunner.run(sql).first
    @id = order['id'].to_i
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

  def delete()
    db = PG.connect({ dbname: 'music', host: 'localhost' })
    sql = "DELETE FROM albums WHERE id = #{@id};"
    db.exec(sql)
    db.close()
  end

  def which()
    sql = "SELECT * from artists WHERE id = #{ @artist_id }"
    artist = SqlRunner.run(sql).first
    result = Artist.new(artist)
    return result    
  end

  def update()
    db = PG.connect({ dbname: 'music', host: 'localhost' })
    sql = "UPDATE albums SET (title, genre, artist_id) = ('#{@title}', '#{@genre}', '#{artist_id}') WHERE id = #{@id}";
    db.exec(sql)
    db.close()
  end
  
end