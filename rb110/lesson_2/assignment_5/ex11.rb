arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

a = arr.map do |sub_array|
  sub_array.reject { |ele| ele % 3 != 0 }
end

p a
