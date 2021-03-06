require_relative('../models/artist.rb')
require_relative('../models/album.rb')

require('pry-byebug')

Album.delete_all
Artist.delete_all

artist1 = Artist.new(
  'name' => 'Frank Turner'
)

artist1.save

artist2 = Artist.new(
  'name' => 'We Are Scientists'
)
artist2.save

artist3 = Artist.new(
  'name' => 'Run the Jewels'
)
artist3.save

artist4 = Artist.new(
  'name' => 'Taylor Swift'
)
artist4.save

artist5 = Artist.new(
  'name' => 'Biffy Clyro'
)
artist5.save

album1 = Album.new(
  'title' => 'Sleep Is For The Week',
  'quantity' => 5,
  'genre' => 'folk punk',
  'artist_id' => artist1.id,
  'url' => 'https://i.imgur.com/HURz1ul.jpg',
  'buy_price' => 5.50,
  'sell_price' => 10.00
)

album1.save

album2 = Album.new(
  'title' => 'Love, Ire and Song',
  'quantity' => 7,
  'genre' => 'folk punk',
  'artist_id' => artist1.id,
  'url' => 'https://i.imgur.com/QkClQ0L.jpg',
  'buy_price' => 4.50,
  'sell_price' => 10.00
)

album2.save

album3 = Album.new(
  'title' => 'Poetry of the Deed',
  'quantity' => 9,
  'genre' => 'folk punk',
  'artist_id' => artist1.id,
  'url' => 'https://i.imgur.com/SE8HKdB.gif',
  'buy_price' => 4.50,
  'sell_price' => 9.00
)
album3.save

album4 = Album.new(
  'title' => 'With Love and Squalor',
  'quantity' => 5,
  'genre' => 'indie',
  'artist_id' => artist2.id,
  'url' => 'https://i.imgur.com/1oaLG2l.jpg',
  'buy_price' => 3.00,
  'sell_price' => 8.00
)
album4.save

album5 = Album.new(
  'title' => 'Brain Thrust Mastery',
  'quantity' => 4,
  'genre' => 'indie',
  'artist_id' => artist2.id,
  'url' => 'https://i.imgur.com/cZ0YhZB.jpg',
  'buy_price' => 3.00,
  'sell_price' => 7.50
)

album5.save

album6 = Album.new(
  'title' => 'Run the Jewels',
  'quantity' => 3,
  'genre' => 'hip hop',
  'artist_id' => artist3.id,
  'url' => 'https://i.imgur.com/sbdDQDi.jpg',
  'buy_price' => 5.00,
  'sell_price' => 10.00
)

album6.save

album7 = Album.new(
  'title' => '1989',
  'quantity' => 11,
  'genre' => 'pop',
  'artist_id' => artist4.id,
  'url' => 'https://i.imgur.com/ehUgso7.png',
  'buy_price' => 5.50,
  'sell_price' => 11.00
)

album7.save

album8 = Album.new(
  'title' => 'Blackened Sky',
  'quantity' => 7,
  'genre' => 'rock',
  'artist_id' => artist5.id,
  'url' => 'https://i.imgur.com/eg82h00.jpg',
  'buy_price' => 4.50,
  'sell_price' => 8.50
)

album8.save

binding.pry

nil
