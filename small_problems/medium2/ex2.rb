=begin

PROBLEM:
input: string
output: true or false
rules:
  explicit:
    - true if the string can be spelled using set of blocks,
    - each block can only use one letter
    - each letter can be used only once
  implicit:
    - case does not matter
    - each letter is only on one block, all letters present
    - a string with more than one instance of a letter will be false
    - maximum word length can be is 13

DATA
array of sub-arrays

ALGORITHM
- define a method `block_word?(string)`
- create an array of sub arrays of all the block letter pairs, uppercase
- turn the input string into an array of characters of the string, uppercase
- iterate through the array of string characters
  - if one of the block sub-arrays includes the string character of the iteration, delete that sub-array
    - will have to iterate through the array of blocks
- return true if array of string characters is the same length as 13 - array of blocks length

=end

# def block_word?(string)
#   blocks = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

#   string = string.upcase.chars
#   string.each do |char|
#     blocks.each do |block|
#       blocks.delete(block) if block.chars.include?(char)
#     end
#   end
#   return true if 13 - blocks.length == string.length
#   false
# end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(string)
  string.upcase!
  BLOCKS.none? { |block| string.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
