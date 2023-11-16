=begin

input: array of string
output: array ro strings with vowels removed
rules:
  explicit:
    - strings should be the same, except with the vowels removed
  implicit:
    - there are both lower and upper case letters in the strings
    - if all letters in a string element are vowels, should return an empty string for that element
algorithm:
  - define method `remove_vowels(array)`
  - iterate through the `array`
    - if the element contains a,e,i,o,u,A,E,I,O,U delete them
  
=end

def remove_vowels(array)
  array.map { |string| string.delete("aeiouAEIOU") }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #== %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) #== %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) #== ['BC', '', 'XYZ']
