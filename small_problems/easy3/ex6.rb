def xor?(a, b)
  return true if (a && !b) || (!a && b)
  return false
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# def xor?(a, b)
#   if a == true && b == false
#    true
#   elsif a == false && b == true
#    true
#   else
#    false
#   end
# end
