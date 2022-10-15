# What will the following code print? Why?

def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number

# It will print 1 because an obeject it true by default so tricky_number is true, so number = 1 causes the return value to be one.