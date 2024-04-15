=begin

PROBLEM
Write a class that converts integers to roman numerals through the constructor method up to 3000.

input: integer
output: equivalent roman numeral string
rules
  explicit:
    - need a `RomanNumeral` class
    - need a constructor with 1 argument, an integer, assigned to an instance variable
    - need an instance method `to_roman` that will convert instance variable to roman numeral string
  implicit:
    - all input arguments will be integers greater than 0

DATA
- `RomanNumeral` class
- constant to convert integers to roman numerals
- `num` instance variable in constructor method
- `valid?` helper method in constructor method
- `to_roman` instance method

ALGORITHM
- define a class `RomanNumeral`
- initialize a constant `CONVERSION`
  - hash
  - 1 = I
  - 2 = II
  - 3 = III
  - 4 = IV
  - 5 = V
  - 6 = VI
  - 7 = VII
  - 8 = VIII
  - 9 = IV
  - 10 = X
  - 40 = XL
  - 50 = L
  - 90 = XC
  - 100 = C
  - 400 = CD
  - 500 = D
  - 900 = CM
  - 1000 = M

- initialize a constructor method
  - set an instance variable `num` equal to constructor argument
  - raise an error if the argument is not a number between 1 and 3000
    - no floats
  - create a reader method for `num`
- define an instance method `to_roman`
  - initialize a local variable `current_num` = `num`
  - initialize an empty array
  - iterate through `CONVERSION` largest key to smallest key
    - do iteration by creating an array of the keys, sorting them in reverse size, and iterating through
    - if `current_num` / current element > 1
      - push largest value to array (`current_num` / current element) times
      - reassign `current_num` to itself % `CONVERSTION`[current element]
    - join the array & return
=end

class RomanNumeral
  attr_reader :num

  CONVERSION = {
    1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX', 10 => 'X', 40 => 'XL', 50 => 'L',
    90 => 'XC', 100 => 'C', 400 => 'CD', 500 => 'D', 900 => 'CM', 1000 => 'M'
  }

  def initialize(num)
    @num = num
    raise(ArgumentError) unless valid_number?
  end

  def valid_number?
    num.instance_of?(Integer) && num >= 1 && num <= 3000
  end

  def to_roman
    remaining_num = num
    roman_array = []

    CONVERSION.keys.sort.reverse.each do |decimal_num|
      quotient, remainder = remaining_num.divmod(decimal_num)
      if quotient >= 1
        roman_array << (CONVERSION[decimal_num] * quotient)
        remaining_num = remainder
      end
    end

    roman_array.join
  end
end
