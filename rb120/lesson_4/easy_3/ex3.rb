class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

=begin

Given the class above, how do we create two different instances of this class
with separate names and ages?

beans = AngryCat.new(5, "beans")
toast = AngryCat.new(10, "toast")

=end
