=begin

You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random p number_of_y length is 1000, range of values in array is between 0 and 1000
Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)

PROBLEM
given an array of integers, return the number of duplicate elements
input: array of integers
output: integer
rules:
  explicit:
    - input array contains only integers
    - output will be an integer
  implicit:
    - for every extra duplicate past 2, increase return integer by 1

DATA
array, iteration || hash

ALGORITHM
- define a method `number_of_pairs(array)`
- create a hash from the array with the numbers as the keys and their count as the values
- create an array of the values of the hash, deleting any elements less than 2
- iterate through the array transformatively, dividing the elements by 2
- sum the array and return the integer

=end

def number_of_pairs(array)
  hash = array.to_h { |ele| [ele, array.count(ele)] }
  array = hash.values.delete_if { |ele| ele < 2 }
  array.map { |ele| ele / 2 }.sum
end

p number_of_pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])# 4
p number_of_pairs([1, 2, 5, 6, 5, 2])# 2
p number_of_pairs([1, 2, 5, 6, 5, 2])# 2
p number_of_pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])# 4
p number_of_pairs([0, 0, 0, 0, 0, 0, 0])# 3 
p number_of_pairs([1000, 1000])# 1
p number_of_pairs([])# 0
p number_of_pairs([54])# 0
