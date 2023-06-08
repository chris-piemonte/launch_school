=begin

input: integer `n`
output: array of integers
rules:
  explicit:
    - there will be n number of iterations
    - each number, 1 - `n`, will be either on or off
    - flip every switch on iteration 1, every other switch on iteration 2, and so on
    - return array should contain all numbers representing the on switches at the end
  implicit:
    - do not start with 1 on each iteration, start with that iteration's number
algorithm:
    - define a method `switches(num)`
    - create an empty array called `on`
    - using the `times` method, `num` times do
      - create an array `temp_array` from n+1 to num
      - remove all numbers not a multiple of n+1
      -iterate through `temp_array`
        - create an if conditional
        - if the current number + 1 is not in `on`, add it
        - otherwise remove it from `on`
      - sort `on`
    - return `on`

=end

def switches(num)
  on = []
  1.upto(num) do |n|
    temp_multiples_array = (n..num).to_a
    temp_multiples_array.delete_if { |ele| ele % n != 0 }
    temp_multiples_array.each do |ele|
      if on.include?(ele)
        on.delete(ele)
      else
        on <<(ele)
      end
    end
  end
  on
end

p switches(5)
p switches(10)
p switches(1000)
