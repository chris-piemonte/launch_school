def stringy(num, default = 1)
  arr = []

  num.times do |ind|
    if default == 1
      number = ind.even? ? 1 : 0
      arr << number
    else
      number = ind.odd? ? 1 : 0
      arr << number
    end
  end
  arr.join
end

p stringy(6,0)
p stringy(9,0)
p stringy(4)
p stringy(7)
