require('pry')
require_relative('artists')
require_relative('albums')

artist1 = Artist.new({ 'name' => 'Monster Magnet' } )

album1 = Albums.new( { 
  "title" => "Powertrip", 
  "genre" => "Stoner Rock",
  "artist_id" => artist1.id
  })
album2 = Albums.new( {
  "title" => "Superjudge",
  "genre" => "Stoner Rock",
  "artist_id" => artist1.id
  })




binding.pry
nil