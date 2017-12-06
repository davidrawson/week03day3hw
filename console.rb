require ('pry-byebug')
require_relative('./models/artist')
require_relative('./models/album')

# Artist.delete_all()

artist1 = Artist.new({
  'artist_name' => 'Prince'
  })

  artist2 = Artist.new({
    'artist_name' => 'Beyonce'
    })


artist1.save
artist2.save


album1 = Album.new({
  'album_title' => 'Lovesexy',
  'genre' => 'pop',
  'artist_id' => artist1.id
  })

  album2 = Album.new({
    'album_title' => 'Lemonade',
    'genre' => 'pop',
    'artist_id' => artist2.id
    })


  album1.save
  album2.save

binding.pry
nil
