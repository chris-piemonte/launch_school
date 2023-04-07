=begin

input: string
output: new string, no duplicate characters next to each other
rules:
  explicit:
    - all duplicate characters 'collapsed' (deleted)
    - cannot use the String#squeeze or String#squeze! methods
  implicit:
    - empty string returns an empty string
    - no ide3ntical characters next to each other (no tripple or more as well as double)
algorithm:
  - define method `crunch(string)`
  - create an array `letters` with each element being the characters of `string`
  - iterate through each element in the `letters` array using Array#each_with_index, set it equal to variable `letters_collapsed`
    - delete the character if it is == to the character at the next index
  - end iteration
  - transform `letters` into a string
=end

def crunch(string)
  answer = []
  
  string.each_char { |char| answer << char if char != answer.last }

  answer.join
end

# def crunch(text)
#   index = 0
#   crunch_text = ''
#   until index == text.length
#     crunch_text << text[index] unless text[index] == text[index + 1]
#     index += 1
#   end
#   crunch_text
# end

p crunch('ddaaiillyy ddoouubbllee') # == 'daily double'
p crunch('4444abcabccba') # == '4abcabcba'
p crunch('ggggggggggggggg') # == 'g'
p crunch('a') # == 'a'
p crunch('') # == ''
