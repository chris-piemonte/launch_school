=begin

write a program that detects whether an input string is a pangram, return True of False.
Ignore numbers & punctuation

PROBLEM
input: string
output: True or False
rules:
  explicit:
    - detect if an input string is a pangram
      - all letters of the alphabet are used
    - teturn true/false
    - ignore punctuation
implicit:
  - 

DATA
array

ALGORITHM
  - define a method `pangram?(string)`
  - initialize an array of all letters of the alphabet
  - iterate through the input string
    - if the string character is included in the array, elete it from the array
  - return true if the array is empty, false if not

=end

def pangram?(string)
  letters = ('a'..'z').to_a
  string.downcase.each_char do |char|
    letters.delete(char) if letters.include?(char)
  end
  p letters
  return true if letters.empty?
  false
end

p pangram?("The quick brown fox jumps over the lazy dog.")
p pangram?("abc")
p pangram?("Cwm fjord bank glyphs vext quiz is a pangram")
