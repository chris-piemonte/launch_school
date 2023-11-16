=begin

Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

solve("1341") = 7. See test cases for more examples.

PROBLEM
return the number of odd substrings that can be formed from input string of integers
input: string of integers
output: integer, number of odd substrings
rules:
  explicit:
    - input is string
    - string characters are all integers
    - return number of odd substrings that can be made
  implicit:
    - all substrings have to be consecutive in input string

DATA
array, nested arrays

ALGORITHM
- define a method `odd_substrings(s)`
- create an empty array `substrings`
- create an array of the characters of `s`

- create the array of substrings
  - iterate through the array with index
    - loop (array size - index) times
    - slice array from index to (index + loop number) times
      - join the array into a string, create an integer from this substring
      - if the integer is odd add the substring to the array `substrings

return the number of substrings in `substrings`

=end

require 'pry'

def odd_substrings(s)
  substrings = []
  numbers = s.chars

  numbers.each_with_index do |_, each_index|
    (numbers.size - each_index).times do |loop_num|
      binding.pry
      if numbers[each_index..each_index + loop_num].join.to_i.odd?
        substrings << numbers[each_index..each_index + loop_num].join
      end
    end
  end

  substrings.size
end

p odd_substrings("13472315")


# iteration index starts at 0
# loop number starts at 0
