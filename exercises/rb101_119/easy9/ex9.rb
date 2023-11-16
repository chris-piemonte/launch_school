=begin

input: array of strings
output: arrays of words that are anagrams
rules:
  explicit:
    - input is array of strings
    - anagrams are words that have the same exact letters but in a different order
  implicit:
    - all words have 4 letters
algorithm:
  - create an array `words_sorted` equal to `words` iterated transformatively with each word sorted by letter
  - iterate through `words`
  

=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
            'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
            'flow', 'neon']

# loop do
#   anagrams = [words[0]]
#   words.delete_at(0)

#   words.each_with_index do |word, ind|
#     anagrams << words[ind] if word.chars.sort == anagrams.last.chars.sort
#   end

#   p anagrams

#   words.delete_if { |word| anagrams.include?(word) }
#   break if words.empty?
# end

result = {}

words.each do |word|
  key = word.chars.sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value { |v| p v }
