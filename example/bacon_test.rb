require 'minitest/autorun'

class Bacon
  def self.saved?
    true
  end
end

class BaconTest < MiniTest::Unit::TestCase
  def test_saved
    assert Bacon.saved?
  end
end
