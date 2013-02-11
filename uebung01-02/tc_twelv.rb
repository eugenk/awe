require_relative "twelv.rb"
require "test/unit"

class TestTwelv < Test::Unit::TestCase
  
  def setup
    @twelv = Twelv.new
  end

  def test_lower
    @twelv.taken_numbers = *(2..12)
    @twelv.left_numbers = [1]
    assert_equal(@twelv.guess_lower,true)
    assert_equal(11,@twelv.left_numbers.length)
    assert_equal(1,@twelv.taken_numbers.length)
  end
  
  def test_lower
    @twelv.taken_numbers = *(1..6)
    @twelv.left_numbers = [12]
    assert_equal(@twelv.guess_higher,true)
    assert_equal(0,@twelv.left_numbers.length)
    assert_equal(7,@twelv.taken_numbers.length)
  end
  
  def test_lower_with_left_numbers
    @twelv.taken_numbers = *(1..6)
    @twelv.left_numbers = [10,11,12]
    assert_equal(@twelv.guess_higher,true)
    assert_equal(2,@twelv.left_numbers.length)
    assert_equal(7,@twelv.taken_numbers.length)
  end

  def test_higher_false
    @twelv.taken_numbers = *(3..12)
    @twelv.left_numbers = [1, 2]
    assert_equal(@twelv.guess_higher,false)
    assert_equal(11,@twelv.left_numbers.length)
    assert_equal(1,@twelv.taken_numbers.length)
  end
  
  def test_lower_false
    @twelv.taken_numbers = *(1..11)
    @twelv.left_numbers = [12]
    assert_equal(@twelv.guess_lower,false)
    assert_equal(11,@twelv.left_numbers.length)
    assert_equal(1,@twelv.taken_numbers.length)
  end
  
  def test_end
    @twelv.taken_numbers = *(1..12)
    @twelv.left_numbers = []
    assert_nil(@twelv.guess_higher)
    assert_equal(11,@twelv.left_numbers.length)
    assert_equal(1,@twelv.taken_numbers.length)
  end

end