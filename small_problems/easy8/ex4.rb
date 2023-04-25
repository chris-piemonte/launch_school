=begin

input: string
outpit: array of palindromic substrings
rules:
  expliicit:
    - returns an array of substrings of all palindromes in the input string
    - return value arranged in the same sequence as the substrings appear in the string
    - duplicate palindromes shoould be included multiple times
    - palindromes are case sensitive
    - single characters are not palindromes
    - use `substrings` method from previous exercise
algorithm
  - define a method `palindromes(string)`
  - create a variable `palindrome_substrings` equal to `substrings(string)`
  - iterate through `palindrome_substrings`
    - delete elements if they are not the same forward and backwards
    - delete elements if they are a single character

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

def palindromes(string)
  palindrome_substrings = substrings(string)
  palindrome_substrings.delete_if do |ele|
    ele.delete('^a-zA-Z0-9') != ele.delete('^a-zA-Z0-9').reverse ||
    ele.delete('^a-zA-Z0-9').size < 2
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
