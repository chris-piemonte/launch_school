=begin

PROBLEM
write a program that given a word computes the scrabble score for that word

input: string
output: integer, based on string score
rules:
  explicit:
    - input string
    - output integer
    - each character of the string has a point value
    - sum up all points and return
  implicit:
    - empty strings, nil, & white space return 0
    - all integers, no floats
    - all strings only contain letters

DATA
- class Scrabble
  - constructor methhod
    - 1 argument `word`
  - method `score` that returns score for word
  - hash/array containing letters & values

ALGORITHM
- define a class `Scrabble`
- define a constructor method
  - 1 parameter `word`, assign to instance variable, lowercase
- create reader method for `word`
- create a hash `VALUES`
  - keys are strings of letters, lowercase
    - create an array of the strings, iterate throgh it, create hash k/v pairs
  - values are point values
- create a method `score`
  - create a counter `points` set to 0
  - iterate through each character of `word` instance variable
  - increment `points` by return value of passing character to `VALUES`
  - return `points`
=end

# class Scrabble
#   attr_reader :word

#   VALUES = {}
#   %w(a e i o u l n r s t).each { |char| VALUES[char] = 1 }
#   %w(d g).each { |char| VALUES[char] = 2 }
#   %w(b c m p).each { |char| VALUES[char] = 3 }
#   %w(f h v w y).each { |char| VALUES[char] = 4 }
#   VALUES['k'] = 5
#   %w(j x).each { |char| VALUES[char] = 8 }
#   %w(q z).each { |char| VALUES[char] = 10 }

#   def initialize(word)
#     @word = word.instance_of?(String) ? word.downcase.strip : ''
#   end

#   def score
#     points = 0
#     word.chars.each { |char| points += VALUES[char] }
#     points
#   end

#   def self.score(word)
#     Scrabble.new(word).score
#   end
# end

class Scrabble
  attr_reader :word

  VALUES = {
    'aeioulnrst' => 1,
    'dg' => 2,
    'bcmp' => 3,
    'fhvwy' => 4,
    'k' => 5,
    'jx' => 8,
    'qz' => 10
  }

  def initialize(word)
    @word = word ? word.downcase : ''
  end

  def score
    points = 0

    word.downcase.gsub(/[^a-z]/, '').chars.each do |char|
      VALUES.each do |letters, value|
        points += value if letters.include?(char)
      end
    end

    points
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
