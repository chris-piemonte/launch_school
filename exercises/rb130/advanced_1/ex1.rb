factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    # yielder.yield(accumulator)
    yielder << accumulator
    number += 1
  end
end

# External iterators

7.times { |number| puts "#{number}! == #{factorial.next}" }
puts '========================'
7.times { |number| puts "#{number}! == #{factorial.next}" }
puts '========================'
factorial.rewind
7.times { |number| puts "#{number}! == #{factorial.next}" }
puts '========================'

# Internal iterators

factorial.each_with_index do |num, ind|
  puts "#{ind}! == #{num}"
  break if ind >= 6
end
puts '========================'
factorial.each_with_index do |num, ind|
  puts "#{ind}! == #{num}"
  break if ind >= 6
end
 