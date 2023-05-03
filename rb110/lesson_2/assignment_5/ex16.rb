def uuid
  characters = %w(a b c d e f 0 1 2 3 4 5 6 7 8 9)
  pattern = [8,4,4,4,12]
  uuid_string = ''

  pattern.each_with_index do |num, ind|
    num.times { uuid_string << characters.sample }
    uuid_string << '-' if ind < pattern.size - 1
  end
  
  uuid_string
end

p uuid
