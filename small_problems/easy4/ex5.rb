def multisum(num)
  arr = []

  (1..num).each do |x|
    if x % 3 == 0 || x % 5 == 0
      arr << x
    end
  end
  arr.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
