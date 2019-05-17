require 'pry'

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
    Cat.all.select do |pet|
      pet.class == Cat
    end
  end

  def dogs
    Dog.all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def walk_dogs
    self.dogs.each{ |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.each{ |cat| cat.mood = "happy" }
  end

  def sell_pets
    self.cats.each do |pet| 
      pet.mood = "nervous" 
      pet.owner = nil
    end
    self.dogs.each do |pet|
      pet.mood = "nervous" 
      pet.owner = nil
    end 
    self.cats.clear
    self.dogs.clear
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end


end