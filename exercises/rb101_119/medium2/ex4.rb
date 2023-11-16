=begin

PROBLEM
Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced,
false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

input: string
output: true/false
rules:
  explicit:
    - parentheses must have equal numbers of left and right
    - paranthese must match
  implicit:
    - if there are ever more right than left parentheses, false

DATA
array or hash

ALRORITHM
  - define a method `balanced?(string)`
  - create a hash with 2 keys, left and right parentheses symbols
  - convert the string into an array of characters
  - iterate through the array
    - if left or right parantheses, add to the value in the hash
    - if right parentheses value > left parentheses value, return false
  - if the values for both keys in hash equal, return true

=end

def balanced?(string)
  hash = {left: 0, right: 0}
  string.chars.each do |char|
    hash[:left] += 1 if char == '('
    hash[:right] += 1 if char == ')'
    return false if hash[:right] > hash[:left]
  end

  hash[:left] == hash[:right]? true : false
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false
