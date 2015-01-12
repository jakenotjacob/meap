require 'minitest/autorun'

class ExampleTest < MiniTest::Unit::TestCase
  #Methods must have "test_" prefix to fully inherit MiniTest functions
  def test_truth
    assert true
  end
end
