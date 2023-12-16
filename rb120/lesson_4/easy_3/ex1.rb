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

# What happens in each of the following cases:

hello = Hello.new
hello.hi

# "Hello" is printed

hello = Hello.new
hello.bye

# an error is returned

hello = Hello.new
hello.greet

# an error is returned

hello = Hello.new
hello.greet("Goodbye")

# "Goodbye" is printed

Hello.hi

# an error is returned
