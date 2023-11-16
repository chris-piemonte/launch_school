=begin

Complete the solution so that it returns the number of times the search_text is
found within the full_text. Overlap is not permitted : "aaa" contains 1 instance
 of "aa", not 2.

Usage example:

full_text = "aa_bb_cc_dd_bb_e", search_text = "bb"
    ---> should return 2 since "bb" shows up twice


full_text = "aaabbbcccc", search_text = "bbb"
    ---> should return 1

PROBLEM
return the number of times an input string is found within a second string
input: string text, search string
ouput: integer, number of times search string is found in string text
rules:
  explicit:
    - each consecutive group of numbers only counts as one instance
  implicit:
    - all inputs are only one letter
    - all inputs are made up of letters

ALGORITHM
- define a method `instances(full_text, search_text)`
- delete all characters except the `search_text` from `full_text` permenantly
- return the length of `full_text` divided by `search_text`

=end

def instances(full_text, search_text)
  full_text.delete!("^#{search_text}")
  full_text.length / search_text.length
end

p instances('abcdeb','b') == 2
p instances('abcdeb', 'a') == 1
p instances('abbc', 'bb') == 1
