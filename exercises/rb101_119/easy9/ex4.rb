=begin

input: string
output: array of string words and their number of characters
rules:
  explicit:
    - words seperated by exactly one space
    - any subbstring of non-space characters is a word
  implicit:
    - empty string returns empty array
algorithm:
  - define a method `word_lengths(string)`
  - split the `string` into an array
  - iterate through `string` transformatively using `map` to return an array
    - at each element, element returns itself plus a space and the length of the element as a string

=end

def word_lengths(string)
  string.split.map { |ele| ele + " #{ele.length.to_s}"}
end

p word_lengths("cow sheep chicken") #== ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") #==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") #== ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") #==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") #== []
