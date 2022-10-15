# What will the following code print? Why?

def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep

=begin
It will put 0 1 2 nil beause it prints the iteration of counting from 0 - 4 but beacuse of the if statement returns
after sheep == 2, and since we exited the method with return but didn't return a specific value the value of return is nil.
=end