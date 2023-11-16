=begin

There is an array with some numbers. All numbers are equal except for one. Try to find it!



=end

def find_uniq(arr)
  arr2 = arr.uniq
  arr2.each { |num| return num if arr.count(num) == 1 }
end

p find_uniq([ 1, 1, 1, 2, 1, 1 ]) #== 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) #== 0.55
