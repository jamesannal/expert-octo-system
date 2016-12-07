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


  
end