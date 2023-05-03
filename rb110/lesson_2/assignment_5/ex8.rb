hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, v|
  v.each do |word|
    puts word.chars.select { |char| char =~ /[aeiou]/ }
  end
end
