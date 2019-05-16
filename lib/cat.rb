class Cat

  SPECIES = "Cat"
  @@all = []

  attr_reader :name
  attr_accessor :mood, :owner
  
  def initialize(name, owner, mood = "nervous")
    @name = name
    @owner = owner
    @mood = mood
    @@all << self
    @species = SPECIES
  end

  def self.all 
    @@all
  end


end