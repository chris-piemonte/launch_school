def compute(argument)
  return "Does not compute." unless block_given?
  yield(argument)
end

puts compute("argument") { |test| test.upcase } == 'ARGUMENT'
puts compute([1,2,3,4,5]) { |array| array.reverse } == [5,4,3,2,1]
puts compute('test') == 'Does not compute.'
