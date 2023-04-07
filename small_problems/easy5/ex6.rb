=begin

input: string
output: hash, key is integer representing number of letters in word, value represents number of words of this length
rules:
  explicit:
  - word consists of any string of characters separated by a space
  - multiple spaces in a row should also be ignored
  implicit:
  - empty array returns an empty hash
  - punctuation counts as string length
algorithm:
  - define a method `word_sizes(string)`
  - reassign `string` to an array of substrings split up by the spaces in the string
  - create an empty array called `word_length_array` to hold the values for the number of characters in each word
  - create an empty hash called `word_sizes` that will contain all the string length/quantity key/value pairs
  - iterate over `string` array
    - determine the size of each string and add to `word_length_array`
    - add the size of the string to the `word_length_array`
  -iterate over `word_length_array`
    - count how many elements match the element being iterated through each word length, and add the length/count to the `word_sizes` hash
  - return the `word_sizes` hash

=end

# def word_sizes(string)
#   string = string.split
#   word_length_array = []
#   word_sizes = {}

#   string.each { |word| word_length_array << word.size }
  
#   word_length_array.each do |size|
#     number = word_length_array.count(size)
#     word_sizes[size] = number
#   end

#   word_sizes
# end

def word_sizes(string)
  array = string.split
  hash = Hash.new(0)

  array.each { |word| hash[word.size] += 1 }
  hash
end

p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') #== { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") #== { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') #== {}
