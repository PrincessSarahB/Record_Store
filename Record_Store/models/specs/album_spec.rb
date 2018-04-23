require('minitest/autorun')
require('minitest/rg')

require_relative('../artist.rb')
require_relative('../album.rb')


class AlbumTest < MiniTest::Test

def setup()


@artist1 = Artist.new({
'id' => 1,
'name' => "Frank Turner"
})

@artist2 = Artist.new({
  'id' => 2,
  'name' => "Taylor Swift"
  })

  @album1 = Album.new({
    'id' => 1,
    'title' => "Sleep is for the Week",
    'quantity' => 6,
    'genre' => "folk punk",
    'artist_id' => @artist1.id,
    'buy_price' => 5.50,
    'sell_price' => 10.00
    })

    @album2 = Album.new({
      'id' => 2,
      'title' => "Love, Ire and Song",
      'quantity' => 2,
      'genre' => "folk punk",
      'artist_id' => @artist1.id,
      'buy_price' => 6.50,
      'sell_price' => 10.00
      })

      @album3 = Album.new({
        'id' => 3,
        'title' => "1989",
        'quantity' => 11,
        'genre' => "pop",
        'artist_id' => @artist2.id,
        'buy_price' => 4.00,
        'sell_price' => 8.00
        })

end

def test_stock_level__low()
assert_equal("low", @album2.stock_level)

end

def test_stock_level__medium()
assert_equal("medium", @album1.stock_level)
end

def test_stock_level__high()
assert_equal("high", @album3.stock_level)
end

def test_margin
  assert_equal(4.00, @album3.margin)
  assert_equal(3.50, @album2.margin)
end 
end
