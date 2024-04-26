=begin

PROBLEM
Implement Octal to decimal converstion

input: string of integers
output: octal integer
rules:
  explicit:
    - input is a string
    - the string only contains integers
    - convert to a decimal integer
  implicit:
    - no negative numbers
    - any string containing characters other than numbers converts to 0

DATA
- class `Octal`
  - constructor method
    - instatntiation paramater
  - reader method for instantiation parameter
  - helper method to convert string into integer
  - instance method `to_decimal` to convert octal integer to decimal

ALGORITHM
- define a class `Octal`
- define an reader method for input parameter
- dfine a constructor method
  - set argument to instance variable `num`
- define a method `to_decimal`
  - initialize a variable `octal_number` set to 0
  - iterate through all of the characters of string as an array, reversed
    - return 0 if char.to_i == 0
    - convert char to an integer, multiply by (8^ind)
    - add to `octal_number`
  - return `octal_number`

=end

class Octal
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def to_decimal
    return 0 if string.match(/[^0-7]/)
    decimal_number = 0

    string.chars.reverse.each_with_index do |num, ind|
      decimal_number += (num.to_i * (8**ind))
    end

    decimal_number
  end
end
