=begin

Write a function that will return the count of distinct case-insensitive alphabetic
characters and numeric digits that occur more than once in the input string. The input
string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

PROBLEM
input: srting
output: count of repeated characters
rules:
  explicit:
    - case insensitive
    - includes numeric digits
  implicit:
    - no spaces

DATA
hash

ALGORITHM
- define a methos `duplicate_count(text)`
- reassign `text` to lowercase versioon of itself

- create a hash of k/v pairs of character/count
  - initiialize an empty hash
  - iterare through the characters of `text`
  - if the count of the character in `text` > 1, add to hash as k with count as v

- return number of k/v pairs

=end

def duplicate_count(text)
  text = text.downcase
  hash = {}

  text.chars.each do |char|
    hash[char] = text.count(char) if text.count(char) > 1
  end

  hash.size
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
