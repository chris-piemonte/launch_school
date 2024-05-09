# rubocop:disable Layout/LineLength
=begin

PROBLEM
Create a custom set type.

input: array

rules:
  - explicit: input will be an array of integers
  - an instance's array is a subset off another instance's array if all it's integers are included in the other subset
  - 2 subsets are equal if they contain only the smae integers
    - doesn't need to be in the same order
  - integers added to the set are added to the end of the array
  - sets cannot have repeat integers

DATA
- `CustomSet` class
  - sets made up of arrays

ALGORITHM
- define a class `CustomSet`
  - create a constructor class `initialize(set=[])`
    - set an instance method `@set = set`
  - create an instance method `empty?`
    - return true if the array is empty
  - create an instance method `contains?(num)`
    - return true if the array contains `num`
  - create an instance method `subset?(other_custom_set)`
    - iterate through self's set
      - return true if every number is included in `other_custom_set`'s set
  - create an instance method `disjoint?(other_custom_set)`
    - iterate through self's set
      - return true if no number's are included in the other set
  - create an instance method `eql?(other_custom_set)`
    - sort both sets, return true if they are equal to each other
  - create an instance method `add(num)`
    - add `num` to the set unless it is already in the set
  - create an instance method `intersection(other_custom_set)`
    - create a new array, push all elements included in both sets to it
    - create a new `CustomSet` instance using the new array
  - create an instance method `difference(other_custom_set)`
    - create a new array, push to it all element's in self's set not included in `other_custom_set`
    - create a new `CustomSet` instance using the new array
  - create an instance method `union(other_custom_set)
    - add together both sets, remove any repeat numbers
    - create a new `CustomSet` instance using the new array
=end
# rubocop:enable Layout/LineLength

class CustomSet
  def initialize(set=[])
    @set = set.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def ==(other_custom_set)
    set.sort == other_custom_set.set.sort
  end

  def eql?(other_custom_set)
    set.sort == other_custom_set.set.sort
  end

  def subset?(other_custom_set)
    set.all? do |num|
      other_custom_set.set.include?(num)
    end
  end

  def disjoint?(other_custom_set)
    set.none? do |num|
      other_custom_set.set.include?(num)
    end
  end

  def add(num)
    set << num unless set.include?(num)
    self
  end

  def intersection(other_custom_set)
    new_set = set.select do |num|
      other_custom_set.set.include?(num)
    end
    CustomSet.new(new_set.uniq)
  end

  def difference(other_custom_set)
    new_set = set.select do |num|
      !other_custom_set.set.include?(num)
    end
    CustomSet.new(new_set)
  end

  def union(other_custom_set)
    new_set = set + other_custom_set.set
    CustomSet.new(new_set.uniq.sort)
  end

  protected

  attr_reader :set
end
