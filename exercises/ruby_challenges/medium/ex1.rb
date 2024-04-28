# rubocop:disable Layout/LineLength
=begin

PROBLEM
The diamond exercise takes as its input a letter, and outputs it in a diamond
shape. Given a letter, it prints a diamond starting with 'A', with the supplied
letter at the widest point.

input: string letter
output: diamond, starting with A at vertical points and chronological letters at each other level up to input letter
rules:
  explicit:
    - A at top & bottom points input letter
    - each consecutive row the consecutive letter in the alphebet up to input letteer
    - all rows have 2 identical letters
    - diamond is horizontally & vertically symetrical
    - width equals height
  implicit:
    - all letters should be capitalized

DATA
- class Diamond
  - class method `make_diamond(letter)`

ALGORITHM
- define a class `Diamond`
  -define a class method `make_diamond(letter)
  - find the size of the range from 'A' to `letter`
  - set a variable `spaces` to size / 2
  - iterate from `A` to `letter`
    - print ' ' `spaces` times & current letter
    - subtract 1 from `spaces`
  - set `spaces` to 1
  - iterate from `letter` - 1 to 'A'
    - print ' ' `spaces` times & current letter
    - add 1 to `spaces
=end
# rubocop:enable Layout/LineLength

class Diamond
  def self.make_diamond(letter)
    return "A\n" if letter == 'A'
    range = ('B'..letter).to_a
    diamond = []

    diamond << diamond_a(range)
    diamond += diamond_top(range)
    diamond += diamond_bottom(range)
    diamond << ("#{diamond_a(range)}\n")
    diamond.join("\n")
  end

  class << self
    private

    def diamond_a(range)
      outside_spaces = range.size
      "#{(' ' * outside_spaces)}A#{(' ' * outside_spaces)}"
    end

    def diamond_top(range)
      outside_spaces = range.size - 1
      inside_spaces = 1
      diamond = []

      range.each do |char|
        diamond << "#{(' ' * outside_spaces)}#{char}#{(' ' * inside_spaces)}" \
                   "#{char}#{(' ' * outside_spaces)}"
        outside_spaces -= 1
        inside_spaces += 2
      end

      diamond
    end

    def diamond_bottom(range)
      outside_spaces = 1
      inside_spaces = (range.size * 2) - 3
      diamond = []

      range.reverse[1..-1].each do |char|
        diamond << "#{(' ' * outside_spaces)}#{char}#{(' ' * inside_spaces)}" \
                   "#{char}#{(' ' * outside_spaces)}"
        outside_spaces += 1
        inside_spaces -= 2
      end

      diamond
    end
  end
end
