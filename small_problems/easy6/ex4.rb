=begin

input: array
output: same array, mutated
rules:
  explicit:
    - returned array must be same array object (same object id)
    - the elements must be in reversed order
  implicit:
    - array can contain integers or strings
    - an empty array returns the same empty array
algorithm:
  - define a method `reverse!(array)`
  - create an array called `array_copy` == `array`
  - create a `counter` set to 0
  - iterate through `array` with destructive transformation, with index
    - assign each element to the previous index in the `array_copy` array using the counter to call the proper index
    - increment counter by 1

=end

def reverse!(array)
  front_index = 0
  back_index = -1

  loop do
    break if front_index == (array.size / 2)
    array[front_index], array[back_index] = array[back_index], array[front_index]
    front_index += 1
    back_index -=1
  end
  array
end

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true
