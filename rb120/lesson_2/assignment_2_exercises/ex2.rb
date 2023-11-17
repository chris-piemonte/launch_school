class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name 
    puts "#{first_name} #{last_name}"
  end
end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'
