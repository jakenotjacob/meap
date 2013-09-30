require 'minitest/autorun'

class Bacon
  def self.saved?
    false
  end
end

class BaconTest < MiniTest::Unit::TestCase
  def test_saved
    assert Bacon.saved? , "The bacon was not saved, and has perished. :("
  end
end
