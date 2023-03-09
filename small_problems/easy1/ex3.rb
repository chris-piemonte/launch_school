def stringy(num, start = 1)
  string = ''

  num.times do |int|
    int += 1 if start == 0
    string << (int.even? ? '1' : '0')
  end
  string
end

puts stringy(6) #== '101010'
puts stringy(9) #== '101010101'
puts stringy(4) #== '1010'
puts stringy(7) #== '1010101'

puts stringy(6,0) #== '101010'
puts stringy(9,0) #== '101010101'
puts stringy(4,0) #== '1010'
puts stringy(7,0) #== '1010101'
