require ('pry-byebug')
require_relative('./models/artist')
require_relative('./models/album')

Album.delete_all()
Artist.delete_all()

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

        album3 = Album.new({
          'album_title' => 'Sign o The Times',
          'genre' => 'pop',
          'artist_id' => artist1.id
          })

          album4 = Album.new({
            'album_title' => 'Parade',
            'genre' => 'pop',
            'artist_id' => artist1.id
            })

            album5 = Album.new({
              'album_title' => 'Dangerously In Love',
              'genre' => 'pop',
              'artist_id' => artist2.id
              })

          album1.save
          album2.save
          album3.save
          album4.save
          album5.save

          all_artists = Artist.all
          all_albums = Album.all

          albums_by_artist = artist1.albums
          binding.pry
          nil
