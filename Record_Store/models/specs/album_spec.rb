require('minitest/autorun')
require('minitest/rg')

require_relative('../artist.rb')
require_relative('../album.rb')

# require('pry')

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
    'artist_id' => @artist1.id
    })

    @album2 = Album.new({
      'id' => 2,
      'title' => "Love, Ire and Song",
      'quantity' => 2,
      'genre' => "folk punk",
      'artist_id' => @artist1.id
      })

      @album3 = Album.new({
        'id' => 3,
        'title' => "1989",
        'quantity' => 11,
        'genre' => "pop",
        'artist_id' => @artist2.id
        })
        # binding.pry
        # nil
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

end
