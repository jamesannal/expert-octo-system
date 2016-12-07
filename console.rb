require('pry')
require_relative('artists')
require_relative('albums')

artist1 = Artist.new({ 'name' => 'Monster Magnet' } )
# artist1.save

album1 = Albums.new({ 
  'title' => 'Powertrip', 
  'genre' => 'Stoner Rock'
  })

album1.save
artist1.save

binding.pry
nil