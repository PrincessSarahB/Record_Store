require('minitest/autorun')
require('minitest/rg')

require_relative('../artist.rb')
require_relative('../album.rb')

class AlbumTest < MiniTest::Test

def setup()
  artist1 = Artist.find_by_name("Frank Turner")

  artist2 = Artist.find_by_name("Run the Jewels")

  artist3 = Artist.find_by_name("Taylor Swift")

@album1 = artist1.find_albums("Sleep Is For The Week")

end

def test_stock_level__low()
  p @album1.stock_level
# assert_equal("low", @album3.stock_level)
end


# def test_stock_level__medium()
# assert_equal("medium", @album1.stock_level)
# end
#
# def test_stock_level__high()
# assert_equal("high", @album2.stock_level)
# end

end
