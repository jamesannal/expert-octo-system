require('pg')
require_relative('./db/sql_runner')


class Artist

  attr_reader :id 
  attr_accessor :name

  def initialize(options)
    @id = options['id'] unless options['id'].nil?
    @name = options['name']
  end

  def save()
    sql = "
    INSERT INTO artists
     (name) 
     VALUES 
     ('#{name}') RETURNING *;
     "
     artist = SqlRunner.run( sql ).first
    @id = artist['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    arts = SqlRunner.run(sql)
    return arts.map { |artist| Artist.new(artist)}
  end

  def self.delete_all()
    db = PG.connect( { dbname: 'music', host: 'localhost' } )
    sql = "DELETE FROM artists;"
    db.exec(sql)
    db.close()
  end

  def delete()
    db = PG.connect({ dbname: 'music', host: 'localhost' })
    sql = "DELETE FROM artists WHERE id = #{@id};"
    db.exec(sql)
    db.close()
  end

  def who()
    sql = "SELECT * from albums WHERE artist_id = #{ @id }"
    orders = SqlRunner.run(sql)
    result = orders.map {|order| Albums.new(order)}
    return result
  end
  
  def update()
    db = PG.connect({ dbname: 'music', host: 'localhost' })
    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id}";
    db.exec(sql)
    db.close()
  end



end