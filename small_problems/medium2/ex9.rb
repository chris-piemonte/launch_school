=begin

input: array
output: same array, sorted
rules:
  explicit:
    - sort using bubble sort method
    - stop after making aps through entire aray without making any swaps
    - mutate the array passed as an argument
    - arrray will contain at least 2 elements
  implicit:
    - array can contain integers or strings
alorithm:
  - define a method `bubble_sort!(array)``
  - create a variable called `size` equal to the size of the input `array`
  - create an outer loop
  - create a variable called `comparator_array` = Array.new(`array`)
    - create an inner loop `size` times
      - compare element 0 & 1 in the array
      - if element 0 is larger, switch it with element 1
      - increment element 0 & 1 by 1
      -end
    -break if `array` == `comparator_array`
  -return the input `array`

=end

def bubble_sort_optimized!(array)
  array_length = array.length
  loop do
    comparator_array = Array.new(array)
    a = 0
    b = 1
      (array_length - 1).times do
        array[a], array[b] = array[b], array[a] if (array[a] <=> array[b]) == 1
        a += 1
        b += 1
      end
    break if array == comparator_array
    array_length -= 1
  end
  array
end

array = [5, 3]
p bubble_sort_optimized!(array)

array = [6, 2, 7, 1, 4]
p bubble_sort_optimized!(array)

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort_optimized!(array)
