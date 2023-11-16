=begin

input: aray of numbers
output: integer
rules:
  explicit:
    - returns the sum of the sums of each leading subsequence for that Array
    - the array will always contain at elast one number
  implicit:
    - single integer array returns that integer
algorithm:
  - define a method `sum_of_sums(array)`
  - create a variable `sum` equal to 0
  - iterate through array with index
    - at each element, add the element times the index to `sum`
  - return sum

=end

def sum_of_sums(array)
  sum = 0

  array.each_with_index { |ele, ind| sum += ele * (array.size - ind) }
  sum
end

p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) #== 4
p sum_of_sums([1, 2, 3, 4, 5]) #== 35
