require('pg')
require_relative('./db/sql_runner')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'] unless options['id'].nil?
    @name = options['name']
  end

  def save()
    db = PG.connect( { dbname: 'music', host: 'localhost' } )
    sql = "INSERT INTO artists (name) VALUES ('#{name}') RETURNING *;"
    @id = db.exec(sql) [0] ['id'].to_i
    db.close()
  end

  def self.all()
    db = PG.connect( { dbname: 'music', host: 'localhost' } )
    sql = "SELECT * FROM artists;"
    arts = db.exec(sql)
    db.close()
    return arts.map { |artists| Artist.new(artists)}
  end


end