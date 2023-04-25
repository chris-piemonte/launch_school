=begin

input: string
output: array of all substrings
rules:
  explicit:
    - ordered by position then size (all index 0 substrings come first)
    - use `leading_substrings` method from previous exercise
algorithm:
  - define a method `substrings(string)`
  - create an empty array `result`
  - loop through string
    - at each character, from the range of the character to the end of the string, pass the range into `leading_substrings`
    - push the return value to `answer`
  flatten `answer` into a single array

=end

def leading_substrings(string)
  answer =[]
  0.upto(string.size - 1) { |ind| answer << string[0..ind] }
  answer
end

def substrings(string)
  result = []
  0.upto(string.size - 1) { |ind| result << leading_substrings(string[ind..]) }
  result.flatten
end

p substrings('abcde') #== [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]
