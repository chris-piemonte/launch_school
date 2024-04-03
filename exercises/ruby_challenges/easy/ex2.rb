=begin

PROBLEM
Determine the number of differences between 2 strings of equal length.

input: new DNA instance as calling object, string as argument
output: integer, number of differences in strings
rules
  explicit:
    - compare the strings to the length of the shorter string
    - each difference comparing the indeces adds 1 to the hamming distance
  implicit:
    - only integers, no floats
    - should raise an error if argument isn't a string of a length of at least one.
    - new DNA object should have DNA string instance variable
    - need a `DNA` class
      - need a `hamming_distance` method for the comparison

DATA
- `DNA` class
- hamming_distance instance method
  - argument for comparison string
- instance variable for object's DNA string

ALGORITHM
- define a class `DNA`
  - define a constructor that takes 1 string argument, assigns to instance variable
  - need a reader method for the instance variable
  - raise an error if constructor argument is invalid
    - must be a string
  - define a method `hamming_distance`
    - take a string as an argument
    - create a counter starting at 0
    - compare the instance variable string length to argument string length
    - whichever string is shorter, compare both strings sliced to that length
      - iterate over the shorter string
      - compare each character to the other string at each element
        - if the character's aren't == increment the counter
      - return the counter

=end

class DNA
  attr_reader :dna

  def initialize(dna)
    @dna = dna
    raise(ArgumentError) unless valid_dna?
  end

  def valid_dna?
    dna.class == String
  end

  def hamming_distance(other_dna)
    hamming_distance = 0
    shortest_size = dna.size < other_dna.size ? dna.size : other_dna.size

    shortest_size.times do |ind|
      hamming_distance += 1 if dna[ind] != other_dna[ind]
    end

    hamming_distance
  end
end
