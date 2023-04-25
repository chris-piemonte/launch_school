=begin

input: string
output: new string, words in reverse order
rules:
  explicit:
    - words in the new string are in reverse order
  implicit:
    - words denoted by spaces
    - empty string returns empty string
    - just spaces returns empty string
algorithm:
  - define a string `reverse_sentence(string)`
  - split the string into an array called `split_string`
  - reverse the arrray `split_string`
  - join the `split_string` array back together as a string, return it

=end

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
