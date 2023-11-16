=begin

input: string
output: string

rules:
  explicit:
    - the first and last letters of every word are swapped
    - the sting will always contain aat least one word
    - the words will always contain at least one letter
    - the string only contains words and spaces
  implicit:
    - swapped letters must retain their case

algorithm:
  - define a method `swap(string)` where `string` is a string argument
  - split `string` into an array of strings using the String#split method
  - call the Array#map method on the array to iterate through each string
    - initialize a variable `first` that is equal to `string[0]``
    - intialize a variable `last` that is equal to `string[-1]``
    - transform the string being iterated by assigning `string[0] = last`
    - transform the string being iterated by assigning `string[-1] = first`
    - end the iteration
  - call Array#join(' ') on the array

=end

def swap_first_last_character(string)
  string[0], string[-1] = string[-1], string[0]
  string
end

def swap(string)
  array = string.split.map do |word|
    swap_first_last_character(word)
  end

  p array.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
