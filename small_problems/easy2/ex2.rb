def feet_to_inches(feet)
  (feet * 12).round(2)
end

def feet_to_cm(feet)
  (feet * 30.48).round(2)
end

puts "I can measure the area of a room for you in both square feet, inches, and centimeters!"
puts "Enter the width of the room in feet:"
width = gets.chomp.to_f
puts "Now enter the length of the room in feet:"
length = gets.chomp.to_f

sq_feet = (width * length).round(2)

puts "The area of the room is #{sq_feet} square feet or #{feet_to_inches(sq_feet)} square inches or #{feet_to_cm(sq_feet)} centimeters."
