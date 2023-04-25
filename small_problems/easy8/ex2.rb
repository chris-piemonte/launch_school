=begin

input: string
output: array of substrings
rules:
  explicit:
    - return value is array of all substrings of argument string starting with the beginning character
    - return value arranged from shortest to longest
  implicit:
    - 1 character string returns an array containing the one character string as its only element
    - there are no spaces in the input strings
algorithm:
  - define a method `leading_substrings(string)`
  - turn `string` into an array of each character of `string`
  - create an empty array called `answer`
  - iterate through the array with index
    - at each index, push array index 0 to the current index, joined together, to `answer`
  - retun `array`

=end

# def leading_substrings(string)
#   string = string.chars
#   answer = []

#   string.each_with_index { |ele, ind| answer << string[0..ind].join }
#   answer
# end

def leading_substrings(string)
  answer =[]
  0.upto(string.size - 1) { |ind| answer << string[0..ind] }
  answer
end

p leading_substrings('abc') #== ['a', 'ab', 'abc']
p leading_substrings('a') #== ['a']
p leading_substrings('xyzzy') #== ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
