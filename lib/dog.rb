class Dog

  SPECIES = "Dog"
  @@all = []

  
  attr_reader :name
  attr_accessor :mood, :owner


  def initialize(name, owner, mood = "nervous")
    @name = name
    @owner = owner
    owner.pets << self
    @mood = mood
    @@all << self
    @species = SPECIES
  end

  
  def self.all
    @@all
  end


end