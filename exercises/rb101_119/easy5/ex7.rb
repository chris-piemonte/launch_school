=begin
input: string
output: hash, containing string size (onnly letters) as keys and number of words of this size as values
rules:
  explicit:
  - words are seperated by spaces
  - non-alphabetic characters do not count in the word size
  implicit:
  -empty string returns an empty hash
algorithm:
  - define a method `word_sizes(string)`
  - call #gsub on `string` to delete all non-alphabetic or space characters
  - create a new hash `word_counts` with a default value of 0
  - create an array `words` by splitting `string` into its individual words
  - iterate through `words`
    - determine the size of each word and add increment it to `word_counts` hash
  - return `word_counts`

=end

def word_sizes(string)
  word_counts = Hash.new(0)
  words = string.gsub(/[^a-zA-Z" "]/, '').split
  
  words.each { |word| word_counts[word.size] += 1 }
  word_counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
