require 'pry'

class Owner

SPECIES = "human"
@@all = []

  attr_reader :name, :species, :pets

  def initialize(name)
    @name = name
    @pets = []
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
    self.pets.select do |pet|
      pet.class == Cat
    end
  end

  def dogs
    self.pets.select do |pet|
      pet.class == Dog
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

  def walk_dogs
    self.dogs.each{ |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.each{ |cat| cat.mood = "happy" }
  end

  def sell_pets
    self.pets.each do |pet| 
      pet.mood = "nervous" 
      pet.owner = nil
    end
    self.pets.clear
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end


end