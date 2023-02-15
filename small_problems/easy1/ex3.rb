def stringy(num, start = 1)
  array = []
  
  num.times { |index| index.even? ? array << start : array << 1 - start }
  array = array.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

p stringy(6,0)
p stringy(9,0)
p stringy(4,0)
p stringy(7,0)
