=begin

Given an array of integers, find the one that appears an odd number of times.
There will always be only one integer that appears an odd number of times.

PROBLEM
input: array of integers
output: integer that appears odd number of times
  rules:
    explicit:
      - always will be only 1 intger that appears an off number of times
    implicit:
      - all integers positive & negative
      - no floats

DATA
array, iteration

ALGORITHM
- define a method `find_it(seq)
- iterate through `seq`
  - count the number of times the element appears in `seq`, return it if it's an odd count

=end

def find_it(seq)
  seq.each { |num| return num if seq.count(num).odd? }
end
