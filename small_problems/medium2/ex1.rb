=begin

PROBLEM
input: text file
output: integer representing the number of words in the longest sentence in the text file
rules:
  explicit:
    - input is an outside text file
    - output is integer of number of wors in longest sentence,
    - sentences ony end with . ! ?
    - '--' counts as a word

ALGORITHM
- pull a text file into the program and assign to a variable
- split the text file into an array of sentences using `text.split(/\.|\?|!/)`
- call transformative iteration on this array, turinging each element into an array of words seperated by whitespace
- initialize a variable `count` = 0
- iterate over the array, count the number of elements in the sub-array and reassign `count` to this value if it's greater than `count`
- return `count`
=end

string = File.open('ex1_text.txt').read
array = string.split(/\.|\?|!/).map! { |sentence| sentence.split }

longest = []
array.each { |sentence| longest = sentence if sentence.count > longest.count }

p longest.join(' ')
p longest.count
