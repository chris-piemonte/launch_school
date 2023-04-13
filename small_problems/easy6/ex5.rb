=begin

input: array
output: new array, elements reversed
rules:
  explicit:
    - new array must have elements of original array in reverse order
    - cannot use Array#reverse
  implicit:
    - empty array returns empty array
    - array with one element returns itself
    - object id of input and output must be different
algorithm:
  - define method `reverse(array)`
  - set a `counter` variable to array.size
  - create an empty new array `result_array`
  - create a loop
    - add the last element of `array` to the end of `result_array` using the `counter`
    - subtract 1 from the counter
    - break when the size of both arrays equal each other
  - return `result_array`

=end

# def reverse(array)
#   result_array = []
#   array.reverse_each { |element| result_array << element }
#   result_array
# end

# def reverse(array)
#   array.each_with_object([]) { |element, array| array.unshift(element) }
# end

def reverse(array)
  array.inject([], :unshift)
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
