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
	end
	
	def test_lower
		@twelv.taken_numbers = *(1..11)
		@twelv.left_numbers = [12]
		assert_equal(@twelv.guess_higher,true)
	end

	def test_higher_false
		@twelv.taken_numbers = *(2..12)
		@twelv.left_numbers = [1]
		assert_equal(@twelv.guess_higher,false)
	end
	
	def test_lower_false
		@twelv.taken_numbers = *(1..11)
		@twelv.left_numbers = [12]
		assert_equal(@twelv.guess_lower,false)
	end
	
	def test_end
		@twelv.taken_numbers = *(1..12)
		@twelv.left_numbers = []
		assert_nil(@twelv.guess_higher)
	end

end