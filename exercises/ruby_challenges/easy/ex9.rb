# rubocop:disable Layout/LineLength
=begin

PROBLEM
Write a program that can generate the lyrics of 99 bottles of beer song

input: verse number, numbers, or nothing
output: one or more verses of the song
rules:
  explicit:
    - print 1 verse, multiple verses, or the whole song
  implicit:
    - 3 methods:
      - verse
      - verses
      - lyrics
    - include new lie at the end of each verse

DATA
- class BeerSong
- `verse` class method
  - prints 1 verse, # of bottles as arguments
- `verses` class method
  - prints multiple verses, # of bottles as multiple arguments
- `lyrics` class method
  - prints all lyrics

ALGORITHM
- define a class `BeerSong`
- define a class method `verse(num)`
  - print the song lyrics, interpolating the `num` argument where appropriate
  - if `num` == 1 or 0 use special lyrics
- define a class method `verses(num1, num2)
  - create a range of numbers between the 2 numbers from largest to smallest, iterate through range
  - print the song lyrics, iterpolating in the current range number
    - if iterating over 1 or 0, add special lyrics
- define a class method `lyrics`
  - print the entire song

=end
# rubocop:enable Layout/LineLength

class BeerSong
  def self.verse(num)
    case num
    when 0 then zero_bottles_lyrics
    when 1 then one_bottle_lyrics
    when 2 then two_bottles_lyrics
    else three_plus_bottles_lyrics(num)
    end
  end

  def self.three_plus_bottles_lyrics(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the " \
      "wall.\n"
  end

  def self.two_bottles_lyrics
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def self.one_bottle_lyrics
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def self.zero_bottles_lyrics
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def self.verses(high, low)
    song = []

    high.downto(low) do |num|
      song << verse(num)
    end

    song.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
