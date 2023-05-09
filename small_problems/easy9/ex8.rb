=begin

input: nested arrays with string and integer
output: array of the string, the integer number of times
rules:
  explicit:
    - list the fruit string, the number of times specified by the integer
algorithm:
  - define a method `buy_fruit(array)`
  - iterate over the array transformatively
    - iterate over each element transformatively
      - return index 0 * index 1

=end

# def buy_fruit(array)
#   new_array = []

#   array.each do |sub_array|
#     sub_array[1].times { new_array << sub_array[0] }
#   end

#   new_array
# end

# def buy_fruit(array)
#   new_array = []

#   array.each do |sub_aray|
#     fruit, number = sub_aray[0], sub_aray[1]
#     number.times { new_array << fruit }
#   end

#   new_array
# end

def buy_fruit(array)
  array.map { |fruit, number| [fruit] * number }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
  # ["apples", "apples", "apples", "orange", "bananas","bananas"]
