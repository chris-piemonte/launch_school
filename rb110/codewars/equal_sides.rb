=begin

You are going to be given an array of integers. Your job is to take that array
and find an index N where the sum of the integers to the left of N is equal to
the sum of the integers to the right of N. If there is no index that would make
this happen, return -1.

PROBLEM
input: array
output: index integer
rules:
  explicit:
    - return the index that would make left and right side of array equal, exclusive
    - return -1 if no index that would work
  implicit:
    - positive and negative integers
    - answer can be 0 or last index

DATA
array, hash?

ALGORITHM
- define a method `find_even_index(array)`

- iterate through the input array with index, find out if elements to the left and right equal each other summed
  - iterate through `array` with index
  - set local variables a & b = empty aray
  - reassign `a` to array from index 0 to current index
  - reassign `b` to array from current index to index -1
  - remove first element from a, last element from b
  - sum `a` and `b`, if they equal each other return index

- return -1 if no indeces work

=end

def find_even_index(arr)
  arr.each_with_index do |ele, ind|
    a, b = [], []
    a = arr[0..ind]
    b = arr[ind..-1]

    a.pop
    b.shift
    return ind if a.sum == b.sum
  end

  -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0 #"Should pick the first index if more cases are valid")
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1
