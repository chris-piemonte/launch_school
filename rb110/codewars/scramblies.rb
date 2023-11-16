=begin

Complete the function scramble(str1, str2) that returns true if a portion
of str1 characters can be rearranged to match str2, otherwise returns false.

PROBLEM
input: 2 strings
outputL true/false
rules:
  explicit:
    - can the second argument be created with the characters of the first argument
    - return true/false
  implicit:
    - all characters lowercase
    - only letters included
    - does the first argument have >= characters of the second element

ALGORITHM
  - define method `scramble(s1, s2)
  - iterate through S2
    - return false if s1 doesn't have >= characters of s2

=end

def scramble(s1, s2)
  s2.each_char { |char| return false if s2.count(char) > s1.count(char) }
  true
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
