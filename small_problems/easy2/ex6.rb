# (1..99).each { |x| puts x if x.odd? } 

# 1.upto(99) { |x| puts x if x.odd? }

number = 1
until number > 99
  puts number
  number += 2
end
