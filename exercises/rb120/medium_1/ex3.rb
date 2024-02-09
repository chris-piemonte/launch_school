class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end

graduate = Graduate.new('Chris', 2012, 'Spot 104')
undergraduate = Undergraduate.new('Rachel', 2012)

