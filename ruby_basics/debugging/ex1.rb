def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Examples

#find_first_nonzero_among(0, 0, 1, 0, 2, 0)
find_first_nonzero_among(1)

=begin

Traceback (most recent call last):
        1: from ex1.rb:9:in `<main>'
ex1.rb:1:in `find_first_nonzero_among': wrong number of arguments (given 6, expected 1) (ArgumentError)

the first method call raises an argument error, it means there was only one paramater given in the method definition and you gave 6 arguments, not one. You should have used an array

Traceback (most recent call last):
        1: from ex1.rb:10:in `<main>'
ex1.rb:2:in `find_first_nonzero_among': undefined method `each' for 1:Integer (NoMethodError)

the second method call ha a NoMethodError because you can't call the each method on an integer, you would need to put ([1])

=end