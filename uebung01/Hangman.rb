class Hangman
	attr_reader :display
	attr_reader :word
	attr_reader :tried_letters
	
	def initialize(word, lives = 8)
		@word = word
		@lives = lives
		@tried_letters = Array.new(0)
		@display = Array.new(0)
		
		@word.length.times do
			@display.push("_")
		end
		
		puts "Gesuchtes Wort: #{self.show(@display)}"
	end
	
	def guess(c)
		if c.length != 1
			puts "Bitte nur ein Zeichen eingeben."
			return
		end
		
		if @tried_letters.include?(c)
			puts "Du hast #{c} schon ausprobiert!"
			return
		end
		
		@tried_letters.push(c)
		
		if @word.include?(c)
			@word.split("").each_with_index do |x,i|
				puts "in: #{c} current: #{x}"
				if c == x
					puts "equal!"
					@display[i] = c
				end
			end
			puts "Treffer! Bisher erraten: #{self.show(@display)}"
			
			if !@display.include?("_")
				puts "Du hast gewonnen! Das Wort lautet \"#{@word}\""
			end
		else
			@lives = @lives - 1
			puts "\"#{c}\" ist nicht im Wort enthalten. Du hast noch #{@lives} Versuche."
		end
	end
	
	def show(d)
		s = ""
		d.each do |c| s << c end
		return s
	end
end


h = Hangman.new("testy")
h.guess("a")
h.guess("t")
h.guess("e")
