=begin

input: string
output: string
rules:
  explicit:
    - all number words replaces with the integer as a string

algorithm:
  - define a method `word_to_digit(string)`
  - 

=end

NUMBERS = %w(zero one two three four five six seven eight nine ten)

def word_to_digit(string)
  NUMBERS.each_with_index { |num, ind| string.gsub!(/\b#{num}\b/, ind.to_s) }
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
