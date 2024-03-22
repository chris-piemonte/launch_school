items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*produce, wheat|
  puts produce.join(', ')
  puts wheat
end

puts '-------------------------------------------'

gather(items) do |apples, *corn_cabbage, wheat|
  puts apples
  puts corn_cabbage.join(', ')
  puts wheat
end

puts '-------------------------------------------'

gather(items) do |apples, *food|
  puts apples
  puts food.join(', ')
end

puts '-------------------------------------------'

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end
