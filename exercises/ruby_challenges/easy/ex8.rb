=begin

PROBLEM
Given a natural number and a set of one or moe other numbers, find the sum of
all multiples of the unumbers in the set that are less than the first number.
If set of numbers not given, use 3 & 5.

input: positive whole numbers, set of one or moe other numbers
output: sum of all multiples less than nateural number
rules
  explicit:
    - natural number will be positive whole number
    - optional set of numbers to find multiples of
      - if none given, defaults to 3 & 5
    - sum all multiples less than natural number
  implicit:
    - multiples will be comma separated numbers
    - multipels will also be positive whole numbers
    - multiples are parameters of new class instantiation
    - method will be class method
    - no errors in test

DATA
- class `SumOfMultiples`
  - constructor method
    - takes 0 + optional arguments
  - reader method for constructor variables
  - class method `to`
    - 1 argument, natural number

ALGORITHM
- define a class `SumOfMultiples`
- define a reader method for `multiples`
- define a constructor method
  - initialize a variable `multiples` set to the instantiation argument
    - if no instantiation argument given, set `multiples` to 3 & 5
- define a class method `to(num)`
  - initialize a variable `sum` set to 0
  - iterate through `multiples`
    - iterate from 1 to `num` non-inclusive
      - if `num` % iterator == 0 increment `sum`
  - return `sum`

=end

class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
    @multiples = [3, 5] if @multiples.empty?
  end

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def to(num)
    array = []

    multiples.each do |mult|
      iterator = mult
      until iterator >= num
        array << iterator
        iterator += mult
      end
    end

    array.uniq.sum
  end
end
