class Owner

SPECIES = "human"
@@all = []

  attr_reader :name, :species

  def initialize(name)
    @name = name
    @@all << self
    @species = SPECIES
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def self.all
    @@all
  end

  def cats
    @@all.select do |pet|
    end
  end


  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

end