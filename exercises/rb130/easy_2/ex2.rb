=begin

PROBLEM
input: 2 argument arrays
output: array of subarrays of matching element indices of each array
rules:
  explicit:
    - arrays have same number of elements
    - cannot use #zip

DATA
Arrays

ALGORITHM
- define a method `zip(array1, array2)`
- create an empty array `answer`
- iterate the size or the array times
  - push a 2 element array of the current iteration index from each array to `answer`
- return `answer`
=end

def zip(array1, array2)
  answer = []
  array1.size.times { |ind| answer << [array1[ind], array2[ind]] }
  answer
end

# def zip(array1, array2)
#   array1.each_with_index.with_object([]) do |(_, ind), answer|
#     answer << [array1[ind], array2[ind]]
#   end
# end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
