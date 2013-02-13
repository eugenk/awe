class Twelv
  # Attribute, die der User bereits gezogen hat (öffentlich)
  attr_accessor :taken_numbers
  # Die Zahlen, die am Anfang vorhanden sind und zum Ende weniger werden
  attr_accessor :left_numbers
  
  # Setze alle Zahlen
  def initialize
    @taken_numbers = []
    @left_numbers = *(1..12)
    take_number
    puts "guess_higher or guess_lower"
  end
  
  # Ziehe eine Number
  def take_number
    if @left_numbers.empty?
      return nil
    end
    @taken_numbers << @left_numbers.delete(@left_numbers.sample)
    puts to_s
    
    @taken_numbers[-1]
  end
  
  # Raten
  def guess(relation)
    if !take_number
      puts "Game has ended. You won"
      puts "Initialize new game..."
      initialize
      return nil
    end
    
    if (@taken_numbers[-1] <=> @taken_numbers[-2]) == relation
       puts "Right guess!"
       return true
    else  
      puts "Game Over!"
      puts "Initialize new game..."
      initialize
      return false
    end
  end
  
  # Ergebnis zeigen
  def to_s
    @taken_numbers.join(", ")
  end
  
  # Nächste Zahl ist höher
  def guess_higher
    guess(1)
  end
  
  # Nächste Zahl ist tiefer
  def guess_lower
    guess(-1)
  end
  
  private :take_number
  private :guess

end
