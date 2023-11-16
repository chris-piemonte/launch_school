=begin

For a given nonempty string s find a minimum substring t and the maximum
number k, such that the entire string s is equal to t repeated k times.

The input string consists of lowercase latin letters.

Your function should return : an array [t, k] (in Ruby and JavaScript)

PROBLEM
input: string, array containing substring
output: array containing minimum substring and amountof times it is repeated so entire
        string = s, substring = k, repeats = t; s = k * t
rules:
  - input is a non-empty sring
  - output is minimum substring & numbr of times it's repeated in array form
  - entire string should be k * t

DATA
array, nested arrays

ALGORITHM
  - define a method `f(s)`
  - create a nested array of all contigous sub-strings
  - initialize empty array `sub_strings`
    - create an array of the characters of `s`
    - iterate through the array w/ index
    -  start a loop from index to the size of the array - 1 
      - slice the array from the index to the loop number, add to `sub_rrays`

    - iterate over `sub-_string`, delete element if sub_string * (`s` length / `sub_string` length) doens't equal `s`

  - return array with sub string, times repeating as elements 0 & 1
    - return shortest substring & number of times it goes into `s` as an array

=end

def f(s)
  sub_strings = []
  s.chars.each_with_index do |_, first_ind|
    first_ind.upto(s.size - 1) do |second_ind|
      sub_strings << s[first_ind..second_ind]
    end
  end

  sub_strings.delete_if do |sub_string|
    n = s.length / sub_string.length
    sub_string * n != s
  end

  answer_string = sub_strings.min_by { |string| string.length }
  [answer_string, s.length / answer_string.length]
end

p f("ababab")
