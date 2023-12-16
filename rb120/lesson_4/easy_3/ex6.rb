
require 'pry'
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

=begin

In the make_one_year_older method we have used self. What is another way we
could write this method so we don't have to use the self prefix?

@age += 1

=end

dutchess = Cat.new('ferral')
dutchess.make_one_year_older
puts dutchess.age
