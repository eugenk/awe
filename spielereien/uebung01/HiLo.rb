class HiLo
	attr_reader :lower
	attr_reader :upper
	
	def initialize(lower, upper)
		@lower = lower
		@upper = upper
		@number = rand(upper-lower) + lower
	end
	
	def guess(num)
		case num <=> @number 
		when -1
			puts "too low..."
		when 1
			puts "too high..."
		else
			puts "found it!"
		end
	end
end
