require('minitest/autorun')
require('minitest/rg')

require_relative('../db/sql_runner')
require_relative('./album.rb')

class AlbumTest < MiniTest::Test

def setup()
@album1 = Album.new({
  "title" => "Sleep Is For The Week",
  "quantity" => 5,
  "genre" => "folk punk",
  "artist_id" => artist1.id
  })
@album2 = Album.new({
  "title" => "1989",
  "quantity" => 11,
  "genre" => "pop",
  "artist_id" => artist4.id
  })
@Album3 = Album.new{
  "title" => "Run the Jewels",
  "quantity" => 3,
  "genre" => "hip hop",
  "artist_id" => artist3.id
  }

end

def test_stock_level__low()
assert_equal("low", @album3.stock_level)
end

end
