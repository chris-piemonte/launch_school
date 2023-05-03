arr = ['10', '11', '9', '7', '8']

# p arr.map { |ele| ele.to_i }.sort.reverse.map { |ele| ele.to_s }

p arr.sort { |a,b| b.to_i <=> a.to_i }
