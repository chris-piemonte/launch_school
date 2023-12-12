class Shelter
  attr_reader :owners

  def initialize
    @owners = []
  end

  def adopt(owner, pet)
    owner.pets << pet
    @owners << owner
    @owners.uniq!
    pet.adopted = true
  end

  def print_unadopted
    puts "The animal Shelter has the following unadopted pets:"
    Pet.all_pets.each do |pet|
      puts "a #{pet.species} names #{pet.name}" if pet.adopted == false
    end
  end

  def print_adopted
    @owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.pets.each do |pet|
        puts "a #{pet.species} named #{pet.name}"
      end
      puts
    end
  end

  def print_adoptions
    print_unadopted
    puts
    print_adopted
  end
end

class Pet
  @@all_pets = []
  attr_accessor :adopted
  attr_reader :species, :name

  def initialize(species, name)
    @species = species
    @name = name
    @adopted = false
    @@all_pets << self
  end

  def self.all_pets
    @@all_pets
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.size
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta = Pet.new('dog', 'Asta')
Laddie = Pet.new('dog', 'Laddie')
fluffy = Pet.new('cat', 'Fluffy')
kat = Pet.new('cat', 'Kat')
ben = Pet.new('cat', 'Ben')
chatterbox = Pet.new('parakeet', 'Chatterbox')
bluebell = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
