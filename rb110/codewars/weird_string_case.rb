=begin

Write a function that accepts a string, and returns the same string with all even
indexed characters in each word upper cased, and all odd indexed characters in each
word lower cased. The indexing just explained is zero based, so the zero-ith index
is even, therefore that character should be upper cased and you need to start over for each word.

The passed in string will only consist of alphabetical characters and spaces(' ').
Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').

PROBLEM
input: string
output: same string, all even indexed characters in each work uppercase, odd lowercased
rules:
  explicit:
    - each word starts at index 0
    - even chars uppercase, odd lowercase
    - return same string
    - only contain words and spaces
  implicit:
    - 

DATA
array of characters

ALGORITHM
- define a method `weirdcase(string)`
- create an array of all characters in string
- start a counter at 0

- iterate through the array with index
  - if the counter is even capitalize the index in `string`
  - if the counter is odd lowercase the index in `string`
  - if the character is a space reassign the counter to 0

- return `string`

=end

def weirdcase(string)
  array = string.chars
  counter = 0

  array.each_with_index do |char, ind|
    if char == ' '
      counter = 0
      next
    end
    string[ind] = string[ind].upcase if counter.even?
    string[ind] = string[ind].downcase if counter.odd?
    counter += 1
  end

  string
end

p weirdcase("String") #== "StRiNg"
p weirdcase("Weird string case") #== "WeIrD StRiNg CaSe"
