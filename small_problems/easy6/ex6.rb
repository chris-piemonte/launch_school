=begin

input: 2 arrays
output: single combined array, no duplicates
rules:
  explicit:
    - congine both arrays
    - no duplicate values, even if there wwere in original arrays
  implicit:
    - 2 empty arrays should return empty array
algorithm:
  - define a method `merge(array1, array2)`
  - combine both arrays into a 3rd array
  - delete duplicate elements

=end

# def merge(array1, array2)
#   array1.concat(array2).uniq
# end

def merge(array1, array2)
  array1 | array2
end

p merge([1, 3, 5], [3, 6, 9]) #== [1, 3, 5, 6, 9]
