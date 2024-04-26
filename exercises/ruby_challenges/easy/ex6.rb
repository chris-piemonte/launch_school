=begin

PROBLEM
determine if numbers are an abundent, perfect, or deficient number
input: integer
output: type of number as string
rules:
  explicit:
    - if the sum of all factors of a number > the number, 'abundent'
    - if the sum of all factors of a number = the number, 'perfect'
    - if the sum of all factors of a number < the number, 'deficient'
  imlicit:
    - inputs are integers
    - input must be greater than 0

DATA
- class `PerfectNumber`
  - constructor method
    1 argument, `num`
  - 1 method, `classify`

ALGORITHM
- define a class `PerfectNumber`
- define a class method `classify`
  - create an empty array
  - iterate from 1 to n`num`
    - divide num by iterator
      - if no remainder, push number to array
  - delete repeat numbers from array
  - sum array
  - classify the sum

=end
require 'pry'
class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1
    factors = []

    1.upto(num - 1) do |iterator|
      remainder = num % iterator
      factors << iterator if remainder == 0
    end

    label(factors.sum, num)
  end

  class << self
    private

    def label(sum, num)
      if sum > num
        'abundant'
      elsif sum < num
        'deficient'
      elsif sum == num
        'perfect'
      end
    end
  end
end

puts PerfectNumber.classify(1)
