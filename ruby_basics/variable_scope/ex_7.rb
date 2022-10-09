# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

# 3 because we are now dealing with method invocation that has a block, which does not restrict the local variable 
# scope to the block like a mehod definition restricts local variable scope to itself.