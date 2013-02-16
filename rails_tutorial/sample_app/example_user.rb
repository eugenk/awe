class User
  attr_accessor :name, :email

  def initialize(attributes = {})
    @name  = attributes[:name]
    @email = attributes[:email]
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end
  
end

class String
  def shuffle
    self.split('').shuffle.join('')
  end
  
  def string_shuffle(s)
    s.shuffle
  end
end


person1 = { first: "Hans", last: "Newton" }
person2 = { first: "Jalyna", last: "Schroeder" }
person3 = { first: "Eugen", last: "Kuksa" }

params = { father: person1, mother: person2, child: person3 }
