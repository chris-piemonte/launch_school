=begin

input: string
outpus: printed longest string w/ number of words printed
rules:
  explicit:
    - print longest sentence based on number of words
    - sentences end with (.), (!), (?)
    - any sequence of characters not spaces or sentence ending characters are words
    - print number of words in longest sentence
algorithm:
  - convert the text into an array of sentences using `sentences = text.split(/\.|\?|!/)`
  - create a variable `longest_sentence` to store the longest sentence
  - iterate through the array using `each`
    - split the element using `String.split`
    - push
  - print `longest_sentence`
  - print `number_of_words`

=end

# def longest_sentence(text)
#   longest_sentence = ''

#   text.split(/\.|\?|!/).each do |sentence|
#     if sentence.split.count > longest_sentence.split.count
#       longest_sentence = sentence 
#     end
#   end

#   puts longest_sentence
#   puts "The longest sentence contains #{longest_sentence.split.count} words."
# end

def longest_sentence(text)
  sentences = text.split(/\.|\?|!/)
  longest_sentence = sentences.max_by { |sentence| sentence.split.size }.strip

  sentence_index = text.index(longest_sentence)
  sentence_length = longest_sentence.size
  longest_sentence << text[(sentence_index + sentence_length)]

  puts longest_sentence
  puts "The longest sentence contains #{longest_sentence.split.size} words."
end

def longest_word(text)
  words = text.split(/\W/)
  longest_word = words.max_by { |word| word.size }
  longest_word_length = longest_word.size

  puts "The longest word is #{longest_word} and it is #{longest_word_length} letters long."
end

def longest_paragraph(text)
  paragraphs = text.split(/\n\n/)
  longest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size }
  longest_paragraph_length = longest_paragraph.split.size

  puts longest_paragraph
  puts "The longest paragraph is #{longest_paragraph_length} words long."
end

def longest(text, unit)
  case unit
  when 'word' then longest_word(text)
  when 'sentence' then longest_sentence(text)
  when 'paragraph' then longest_paragraph(text)
  end
end

text = File.read('ex1_text.txt')

longest(text, 'paragraph')
