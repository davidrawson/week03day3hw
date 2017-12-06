require ('pry-byebug')
require_relative('./models/artist')

# Artist.delete_all()

artist1 = Artist.new({
  'artist_name' => 'Prince'
  })


artist1.save



binding.pry
nil
