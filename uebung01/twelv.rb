class Twelv
	# Attribute, die der User bereits gezogen hat (öffentlich)
	attr_reader :taken_numbers
	# Die Zahlen, die am Anfang vorhanden sind und zum Ende weniger werden
	attr :left_numbers
	
	# Setze alle Zahlen
	def initialize()
		@taken_numbers = []
		@left_numbers = *(1..12)
	end
	
	# Ziehe eine Number
	def take_number()
		if @left_numbers.length == 0
			return nil
		end
		number = @left_numbers[Random.rand(@left_numbers.length)]
		@taken_numbers.push(number)
		@left_numbers -= [number]
		return number
	end

end