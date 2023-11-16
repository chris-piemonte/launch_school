=begin

input: string
output: new string
rules:
  explicit:
    - first word of every character capitalized
    - every other character lowercase
    - words are any sequence of non-blank characters
algorithm:
  - define a method `word_cap(string)`
  - create an array `array` where each element is a word from `string`
  - iterate through `array` with transformation
    - for each element, capitalize the first character destructively
    - for element index 1 - -1, lowercase destructively
  - turn the `array` back into a string with a space between each element

=end

# def word_cap(string)
#   array = []
  
#   string.split.each do |ele|
#     array << ele[0].upcase
#     array << ele[1..].downcase
#     array << ' '
#   end
# array.join.strip
# end

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
