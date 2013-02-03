class Twelv
	# Attribute, die der User bereits gezogen hat (öffentlich)
	attr_reader :taken_numbers
	# Die Zahlen, die am Anfang vorhanden sind und zum Ende weniger werden
	attr :left_numbers
	
	# Setze alle Zahlen
	def initialize()
		@taken_numbers = []
		@left_numbers = *(1..12)
		take_number
		puts "guess_higher or guess_lower"
	end
	
	# Ziehe eine Number
	def take_number()
		if @left_numbers.length == 0
			return nil
		end
		number = @left_numbers[Random.rand(@left_numbers.length)]
		@taken_numbers.push(number)
		@left_numbers -= [number]
		puts to_s
		return number
	end
	
	# Raten
	def guess(relation)
		if take_number() == nil
			puts "Game has ended. You won \n"
			puts "Initialize new game...\n"
			initialize()
			return
		end
		
		if (@taken_numbers[-1] <=> @taken_numbers[-2]) == relation
 			puts "Right guess! \n"
		else	
			puts "Game Over! \n"
			puts "Initialize new game...\n"
			initialize()
		end
	end
	
	# Ergebnis zeigen
	def to_s
		return @taken_numbers.join(", ")
	end
	
	# Nächste Zahl ist höher
	def guess_higher() 
		guess(1)
	end
	
	# Nächste Zahl ist tiefer
	def guess_lower()
		guess(-1)
	end
	
	private :take_number
	private :guess

end