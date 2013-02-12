require_relative 'roman.rb'
require 'test/unit'

class Test_Roman < Test::Unit::TestCase
  def setup
    @symbols = 'IVXLCDM'
    @sym_val_map = @symbols.split('').zip([1,5,10,50,100,500,1000])
    @complex_conversion_map =
        [
            ['III',3],
            ['IV',4],
            ['VI',6],
            ['VIII',8],
            ['IX',9],
            ['XIII',13],
            ['XIV',14],
            ['XVI',16],
            ['XVIII',18],
            ['XIX',19],
            ['CXLIX',149],
            ['DLV',555],
            ['MIX',1009],
            ['MCDXCIX',1499]
        ]
    @r = Roman.new
  end

  def test_roman_to_int_basic
    @sym_val_map.each do |sv|
      assert_equal(sv[1],@r.roman_to_int(sv[0]))
    end
  end

  def test_roman_to_int_complex
    @complex_conversion_map.each do |sv|
      assert_equal(sv[1],@r.roman_to_int(sv[0]))
    end
  end

  def test_int_to_roman_basic
    @sym_val_map.each do |sv|
      assert_equal(sv[0],@r.int_to_roman(sv[1]))
    end
  end

  def test_int_to_roman_complex
    @complex_conversion_map.each do |sv|
      assert_equal(sv[0],@r.int_to_roman(sv[1]))
    end
  end

  def test_int_roman_int
    @sym_val_map.concat(@complex_conversion_map).each do |sv|
      assert_equal(sv[1],@r.roman_to_int(@r.int_to_roman(sv[1])))
    end
  end

  def test_roman_int_roman
    @sym_val_map.concat(@complex_conversion_map).each do |sv|
      assert_equal(sv[0],@r.int_to_roman(@r.roman_to_int(sv[0])))
    end
  end

  def test_error_unknown_symbol
    error_cases = %w"A B F AC IO MCDXCIXF"
    error_cases.each do |s|
      assert_raise UnknownRomanSymbolError do
        @r.roman_to_int(s)
      end
    end
  end

  def test_error_nonpositive_number
    error_cases = [0, -1, -1499]
    error_cases.each do |i|
      assert_raise NonPositiveNumberError do
        @r.int_to_roman(i)
      end
    end
  end

  def test_error_bad_symbol_order
    basic_error_cases = %w"IL IC ID IM VX VL VC VD VM XD XM LC LD LM DM"
    error_cases = basic_error_cases.concat(basic_error_cases.map{|c| 'MMM' << c})
    error_cases.each do |r|
      assert_raise BadSymbolOrderError do
        @r.roman_to_int(r)
      end
    end
  end
end