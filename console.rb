require('pry')
require_relative('artists')
require_relative('albums')

Albums.delete_all
Artist.delete_all

artist1 = Artist.new({ 'name' => 'Monster Magnet' } )
artist1.save

artist2 = Artist.new({ 'name' => 'Tool' } )
artist2.save

artist3 = Artist.new({ 'name' => 'A Perfect Circle' } )
artist3.save

album1 = Albums.new( { 
  'title' => 'Powertrip', 
  'genre' => 'Stoner Rock',
  'artist_id' => artist1.id
  })
album1.save

album2 = Albums.new( {
  'title' => 'Superjudge',
  'genre' => 'Stoner Rock',
  'artist_id' => artist1.id
  })
album2.save

album3 = Albums.new( {
  'title' => 'Lateralus',
  'genre' => 'Progressive Metal',
  'artist_id' => artist2.id
  })
album3.save

album4 = Albums.new( {
  'title' => 'Mer De Noms',
  'genre' => 'Progressive Rock',
  'artist_id' => artist3.id
  })
album4.save

binding.pry
nil