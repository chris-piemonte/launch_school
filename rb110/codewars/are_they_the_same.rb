=begin

Given two arrays a and b write a function comp(a, b) (orcompSame(a, b)) that
checks whether the two arrays have the "same" elements, with the same multiplicities
(the multiplicity of a member is the number of times it appears). "Same" means, here,
that the elements in b are the elements in a squared, regardless of the order.

PROBLEM
input: 2 arrays of integers
output: true if the elements in array 1 squared are the elements in array 2, false otherwise
  rules:
    explicit:
      - elements in b have to be the elements of a squared
      - order doesn't matter
    implicit:
      - arrays will be equal size
      - only integers
      - all of array b will be positive
      - sign doesn't matter for a

DATA
arrays

ALGORITHM
- define a method `comp(array1, array2)

- iterate through array1 transformatively and destructively
  - reassign each element to itself squared

- return true if array1 sorted == array2 sorted

- false

=end

def comp(array1, array2)
  return false if array1.class == NilClass || array2.class == NilClass
  array1.map! { |num| num**2 }
  return true if array1.sort == array2.sort
  false
end

p comp([121, 144, 19, 161, 19, 144, 19, 11], [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) == true
