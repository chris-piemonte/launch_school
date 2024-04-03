=begin

PROBLEM
write a program that takes a word and list of possible anagrams and selects the
correct sublist that contains teh anagrams of the word

input: string
output: array containing anagram string from list of strings
rules
  explicit:
    - one input string in constructor method
    - return array with anagram string
  implicit:
    - all test cases return a list of 1 string max
    - no matches returns empty array
    - `match` method takes array of strings as argument

DATA
- class Anagram
  - constructor method with instance variable to store string argument at instantiation
  - `match` instance method to return anagram

ALGORITHM
- define a class Anagram
  - constructor method with 1 string argument
    - instance variable assigned to string argument
  - define a getter method for instance variable
  - method `match(list)`
    - `list` is an array of strings
    - iniialize an empty array
    - iterate through the list of strings
      - next iteration if instance variavble == current word
      - if instance variable turned into an array of letters and sorted is equal
        to current string iteration under same conditions, push iteration to array
    - return the array

=end

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  # def match(list)
  #   anagrams = []

  #   list.each do |list_word|
  #     next if word.downcase == list_word.downcase
  #     if word.downcase.chars.sort == list_word.downcase.chars.sort
  #       anagrams << list_word 
  #     end
  #   end

  #   anagrams
  # end

  def match(list)
    list.select do |list_word|
      word.downcase.chars.sort == list_word.downcase.chars.sort &&
      word.downcase != list_word.downcase
    end
  end
end
