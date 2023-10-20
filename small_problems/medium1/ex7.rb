=begin

Write a method that takes a sentence string as input, and returns the same string with any sequence of the words
'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

PROBLEM
input: string
output: new string
rules:
  explicit:
    - output is string with all integer words converted to digits
  implicit:
    - output will be a new string

DATA
array

ALGORITHM
- define a mehtod `word_to_digit(string)`
- initialize a constant array numbers where each key is the number word zero - nine
- initialize an array where each word of the input string is an element
- iterate over the array transformatively, mutating
  - if the element is included i `numbers`, convert it to a string digit using the array's index for that element
  - if it isn't return itself
- join the array together into a string

=end

def word_to_digit(string)
  numbers = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  array = string.split

  array.map! do |word|
    if numbers.include?(word)
      numbers.index(word)
    elsif word.end_with?('. ') && numbers.include?(word[0..-2])
      "#{numbers.index(word[0..-2])}" + '.'
    else
      word
    end
  end

  array.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
