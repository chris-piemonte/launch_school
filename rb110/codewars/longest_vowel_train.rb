=begin

The vowel substrings in the word `codewarriors` are o,e,a,io. The longest of
these has a length of 2. Given a lowercase string that has alphabetic characters
only (both vowels and consonants) and no spaces, return the length of the longest 
vowel substring. Vowels are any of aeiou.

PROBLEM
return the length of the longest voewl substring
input: string
output: integer, length of the longest voewl substring
rules:
  explicit:
    - return the length of the longest vowel substring
    - input string has no vowels or non-alphabetic characters

ALGORITHM
- define method `longest_vowel(string)`
- split the string into an array with any constant being the delimiter
- return the maximum length of a string in the array

=end

def longest_vowel(s)
  array = s.split(/[^aeiou]/)
  array.max_by { |string| string.length }.length
end

# p longest_vowel("codewarriors") == 2
# p longest_vowel("suoidea") == 3
# longest_vowel("iuuvgheaae") #== 4
p longest_vowel("ultrarevolutionariees") #== 3
# p longest_vowel("strengthlessnesses") == 1
# p longest_vowel("cuboideonavicuare") == 2
# p longest_vowel("chrononhotonthuooaos") == 5
# p longest_vowel("iiihoovaeaaaoougjyaw") == 8
