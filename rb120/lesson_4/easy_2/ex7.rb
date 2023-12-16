class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

=begin

Explain what the @@cats_count variable does and how it works. What code would
you need to write to test your theory?

It counts the number of objects instantiated by the Cat class by incrementing
the @@cats_count class variable by 1 each time a new instance is created

=end

puts Cat.cats_count
