=begin

input: string
output: integer
rules:
  Explicit Requirements:
    - Every character in the string must be converted to the ASCII Value
    - The values must be summed into a single integer
  Implitic Requirements
    - Spaces have an ASCII value and must be included
    - an empty string should return 0

Algorithm:
  - initialize a method called `ascii_value(string)`
  - initialize a variable called `sum` equal to 0 that will be used to contain the sum of all of the strings' characters' ASCII values
  - use the String#chars method to create an array called `characters` that is all of the individual characters of the string argument,
  - iterate through the `characters` array using Array#each, calling the String#ord method to determine the ASCII value and add to the sum variable
  - return the `sum` variable
  -end the method

=end

def ascii_value(string)
  sum = 0
  characters = string.chars
  
  characters.each { |char| sum += char.ord }
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
