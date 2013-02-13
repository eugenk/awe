require_relative 'unknown_roman_symbol_error.rb'
require_relative 'bad_symbol_order_error.rb'
require_relative 'non_positive_number_error.rb'
class RomanDecimalConverter
  def initialize
    @basic_symbols =%w"M D C L X V I"
    @basic_values =[1000, 500, 100, 50, 10, 5, 1]
    @basic_sym_val_map = @basic_symbols.zip(@basic_values)

    @symbols = %w"M CM D CD C XC L XL X IX V IV I"
    @values = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
    @sym_val_map = @symbols.zip(@values)
  end

  def int_to_roman(num)
    raise NonPositiveNumberError, "Argument not positive: #{num}" unless num > 0
    result = ''
    @sym_val_map.each do |roman, decimal|
      (num / decimal).times do
        result << roman
      end
      num %= decimal
    end
    result
  end

  def roman_to_int(roman_num)
    roman_num = roman_num.upcase
    raise UnknownRomanSymbolError, "Unknown roman symbol in: #{roman_num}" if contains_unknown_symbol?(roman_num)
    raise BadSymbolOrderError, "Bad symbol order in: #{roman_num}" if has_bad_symbol_order?(roman_num)
    roman_to_int_worker(roman_num)
  end

  def roman_to_int_worker(roman_num)
    if roman_num.empty?
      return 0
    end

    @sym_val_map.each do |roman, decimal|
      pos = roman_num.index(roman)
      next if pos == nil
      if pos == 0
        return decimal + roman_to_int_worker(roman_num[pos+1..-1])
      elsif pos > 0
        return decimal - roman_to_int_worker(roman_num[0..pos-1]) + roman_to_int_worker(roman_num[pos+1..-1])
      end
    end
    0
  end

  def contains_unknown_symbol?(roman_num)
    !roman_num.delete('MDCLXVI').empty?
  end

  def has_bad_symbol_order?(roman_num)
    %w"IL IC ID IM VX VL VC VD VM XD XM LC LD LM DM".each do |s|
      if roman_num.index(s)
        return true
      end
    end
    false
  end

  private :contains_unknown_symbol?
  private :has_bad_symbol_order?
  private :roman_to_int_worker
end
