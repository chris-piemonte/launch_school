=begin

input: string
output: string
rules:
  explicit:
    - return value second to last word in string
    - word is any sequence of non-blank charactrs
    - string will always contain at least 2 words
algorithm:
  - define a method `penultimate(string)`
  - turn the string into an array of strings separated by spaces
  - call `array` index -2

=end

# def penultimate(string)
#   string.split[-2]
# end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

=begin

input: string
output: string
rules:
  explicit:
    - return value is middle word in string
    - word is any sequence of non-blank charactrs
  implicit:
    - strings can contain one or no words
algorithm:
  - define a method `penultimate(string)`
  - define a variable `middle_word` = the length of the string divided by 2
  - turn the string into an array of strings separated by spaces
  - if `string` length is odd
    - return the array at index `middle_word`
  -elseif `middle_word` length is even
    - return the array at index `middle_word` - 1 and the element one to the right of it

=end

def penultimate(string)
  middle_word = string.split.length / 2
  array = string.split
  answer = ''

  if array.length.odd?
    answer = array[middle_word]
  elsif array.length.even?
    answer = array[middle_word - 1, 2]
  end

  answer
end

p penultimate('last word') #== 'last'
p penultimate('Launch School is great!') #== 'is'
p penultimate('This is five word sentence')
p penultimate('')
p penultimate('word')
