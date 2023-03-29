# statement = "The Flintstones Rock"

# statement = statement.chars
# statement.delete(" ")

# letters = {}
# statement.each { |char| letters[char] = statement.count(char) }

# p letters

statement = "The Flintstones Rock"

letters = {}
alphabet = ("A".."Z").to_a + ("a".."z").to_a

alphabet.each do |char|
  char_count = statement.count(char)
  letters[char] = char_count if char_count > 0
end

p letters
