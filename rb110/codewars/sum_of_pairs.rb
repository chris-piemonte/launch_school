=begin

Given a list of integers and a single sum value, return the first two values
(parse from the left please) in order of appearance that add up to form the sum.

If there are two or more pairs with the required sum, the pair whose second
element has the smallest index is the solution.

PROBLEM
input: array of integers, integer
output: 2 element array
rules:
  explicit:
    - return first 2-element sub-array that add up to integer
    - if 2 sub-arrays sum to integer, return sub-array where second element has smallest index
  implicit:
    - only integers in argument
    - both positive and negative numbers

DATA
array, nested sub-arrays, hash for index of second element

ALGORITHM
- define a method  `sum_pairs(ints, s)

- create an array of nested 2-element sub-arrays
  - create an empty array `sub_arrays`
  - create an empty hash called `indeces`
  - iterate through `ints` with index
    - create a loop from index + 1 to size or `ints` - 1
    - add array of current element and `ints` at current loop iteration to `sub_arrays`
    - add k/v pair to hash of `ints` at current loop iteration/curent index

- find sub array(s) that sum up to 2nd method argument
  - iterate through `sub_arrays`, delete all sub-arrays that do not sum to `s`

- if multple sub-arrays work, return one with smallest index element 2
    - iterate through `sub_arrays`, return sub array that element 2 has smallest value in hash

=end

def sum_pairs(ints, s)
  sub_arrays = []

  ints.each_with_index do |num, ind|
    (ind + 1).upto(ints.size - 1) do |ind2|
      sub_arrays << [[num, ints[ind2]], ind2]
    end
  end

  sub_arrays.delete_if { |sub| sub[0].sum != s }
  answer = sub_arrays.min_by { |sub| sub[1] }
  answer[0]
end

p sum_pairs([4, 3, 2, 3, 4, 2], 6) #== [4, 2]
