# rubocop:disable Layout/LineLength
=begin

PROBLEM
Write a program that will take a string of digits and return all the possible
consecutive number series of a specified length in that string

input: string of digits
output: nested array with list of consecutive digits specified in method argument
rules
  explicit:
    - input will be string of positive digits
  implicit:
    - sub-arrays in result will be single digits, commma separated
    - sub array digits will be integers
    - no floats
    - sub-arrays will be in left-to-right order taken from calling string
    - raise ArgumentError if consecutive number series argument is greater than string length

DATA
- class `Series(string)`
  - reader method for `string`
  - constructor method for `string`
  - `slices(num)` instance method

ALGORITHM
- define a class `Series(string)`
- define a constructor method
  - assign `string` to an instance variable
- define a getter method for the `string` instance variable
- define a `slices(num)` instance method
  - create a return array to hold the slices
  - iterate through the charaters of slices from index 0 to insex `sring` size - `num`
    - push current index & next indexes `num` times to a 2nd array, one at a time
    - push entire array to return array
  - return the return array

=end
# rubocop:enable Layout/LineLength

class Series
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def slices(num)
    raise ArgumentError if num > string.size
    p string.chars.map(&:to_i).each_cons(num)
  end
end
