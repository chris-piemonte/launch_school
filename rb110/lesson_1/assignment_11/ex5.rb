flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.each do |name|
#   answer = ''
#   answer << name if name.start_with?("Be")
# end

p flintstones.index { |name| name[0, 2] == "Be" }
