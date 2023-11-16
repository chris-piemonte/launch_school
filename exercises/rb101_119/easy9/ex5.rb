=begin

input: string
output: string
rules:
  explicit:
    - string will always be first name then last name with a space
    - return a string that contains the last name, a comma, a space, and the first name
algorithm:
  - define  amethod `swap_name(string)`
  - split the string into an array
  - swap the two elements in the array
  - join the array together as a string with a comma and space between the two elements

=end

# def swap_name(string)
#   array = string.split
#   array[0], array[1] = array[1], array[0]
#   array.join(', ')
# end

def swap_name(string)
  string.split.reverse.join(', ')
end

p swap_name('Joe Roberts') #== 'Roberts, Joe'
