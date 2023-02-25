def multiply(x, y)
  mult = x * y
end

# def square(z)
#   answer = multiply(z, z)
#
#   puts answer
#   answer
# end

# def cube(z)
#   answer = multiply(z, z) * z
# 
#   puts answer
#   answer
# end

def fourth(z)
  answer = multiply(z, z) * multiply(z, z)
    
  puts answer
  answer
end

fourth(5)
fourth(-8)
