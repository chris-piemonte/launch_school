class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

=begin

In the last question we had the above classes
If we call Hello.hi we get an error message. How would you fix this?

change the methos in Hello to:

  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end

=end
