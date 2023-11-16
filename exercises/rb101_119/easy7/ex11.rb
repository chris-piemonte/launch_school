=begin

input: array
output: print results from hash
rules:
  explicit:
    - count the number of occurrences of ceach element in an array
    - strings are case-sensitive
    - print each element alongside the numebr of occurances
algorithm:
  - define a method `count_occurrences(array)`
  - create an empty hash `answers`
  - iterate through `array`
    - for each element, count the number of times it is in `array` using `Array#count`
    - add the array and number to the `answers` hash
  - puts `answers`

=end

def count_occurrences(array)
  # array = array.join(' ').downcase.split
  array.map!(&:downcase)
  answers = {}
  array.each { |ele| answers[ele] = array.count(ele) }
  answers.each { |k, v| puts "#{k} => #{v}"}
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv', 'sUv'
]

count_occurrences(vehicles)
