=begin

# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

PROBLEM
input: string
output: string, every 3rd word has every 2nd character uppercase
rules:
  explicit:
    - all other characters remain the same
  implicit:
    - words seperated by spaces
    - if less than 2 characters in a strings nothing will happen

DATA
array of substrings

ALGORITHM
- define a method `to_weird_case(string)`
- create an array of substrings separated by spaces

- start a counter at 3
- iterate through the substrings
  - if counter % 3 == 0, substring character 2 uppercase
  - increment counter by 1

re-join the array of substrings and return it

=end
require 'pry'
def to_weird_case(string)
  array = string.split(' ')

  1.upto(array.size) do |sub_counter|
    if sub_counter % 3 == 0
      array[sub_counter - 1].size.times do |ind|
        array[sub_counter - 1][ind] = array[sub_counter - 1][ind].upcase if ind.odd?
      end
    end
  end

  array.join( ' ')
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'
