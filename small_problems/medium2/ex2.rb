=begin

input: string
outpus: true/false
rules:
  explicit
    - using a method, can the argument word be spelled with the 2 word pairs in the method
    - letters are in pairs of 2
    - you can only use 1 letter from each block
    - each block can only be used once
  implicit
    - the word and blocks should not be case sensitive
algorithm:
  - define a method `block_word?`
  - list all letter pairs as sub-arrays in an array called `blocks`
  - create an empty variable called `argument_test` ***is this part necessary?
  - create a variable called `argument_letters` that is an array of the individual leters of the argument string
  - iterate through the `argument_letters` variable
    - iterate through the `blocks` array
      - if the `argument_letters` element is in the `blocks` element
        - push the `argument_letters` element to `argument_test` ***is this part necessary?
        - delete that `blocks` element pair permeneantly
        - go to the next iteration
      - else return `false`

=end

# def block_word?(word)
#   blocks = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
#             ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
#             ['V', 'I'], ['L', 'Y'], ['Z', 'M']]
#   word_letters = word.chars
#   word_test = ''

#   word_letters.each do |letter|
#     blocks.each_with_index do |block, ind|
#       if block.include?(letter.upcase)
#         word_test << letter
#         blocks.delete_at(ind)
#         break
#       end
#     end
#   end

#   word_test == word
# end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)
def block_word?(string)
  string = string.upcase
  BLOCKS.none? { |block| string.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
