require 'pry'

class Owner

@@all = []

  attr_reader :name, :species

  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
  end

  def buy_cat(name)
    Cat.new(name, self)
    # We are passing in self, because we know that Cat.new() takes in a name and owner
    # In this case, since it is getting called on an INSTANCE of owner already, 
    # we need to associate this owner with this new cat.
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def self.all
    @@all
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self 
    end
  end

  # This method basically ensures that when we create an instance of Owner, we are
  # able to associate all the cats they own, rather than just return all cats across
  # all owners. We are filtering the array of ALL cats by owner name, and using 
  # select so that it will return an array of the cats that they own.

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  # Same explanation as above.

  def self.count
    # self.all.length (will call the self.all method from above, which just returns @@all!)
    @@all.length
  end

  def self.reset_all
    #s elf.all.clear (same explanation as self.count!)
    @@all.clear
  end

  def say_species
    "I am a #{self.species}."
    # can also be @species, but self is usually better since if we have a setter 
    # method it will always follow the changes.
  end

  def walk_dogs
    self.dogs.collect do |dog| 
      dog.mood = "happy"
    end
  end

  # Again, use the instance method self.dogs (.dogs is the instance method above) instead
  # of the class method dogs.all because the tests are only testing one owner. If it was 
  # testing multiple owners, it would fail becuase it would be assuming that someone is 
  # walking ALL dogs at once and making them ALL happy, which is ridiculous.

  def feed_cats
    self.cats.collect do |cat| 
      cat.mood = "happy"
    end
  end

  def sell_pets
    all_pets = self.cats + self.dogs
    all_pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end
    # We did the following:

    # self.cats.each do |pet| 
    #   pet.mood = "nervous" 
    #   pet.owner = nil
    # end
    # self.dogs.each do |pet|
    #   pet.mood = "nervous" 
    #   pet.owner = nil
    # end 
    # self.cats.clear
    # self.dogs.clear

    # ^ This way is too bulky! Remember, this is an instance of an owner selling 
    # all of his/her pets, not ALL the dogs and cats of everyone! Therefore, we need 
    # self.dogs and self.cats (translates to "shu's dogs" and "shu's cats") which are
    # both arrays, and can therefore be added together to make one big array of 
    # all_pets with no need to flatten or concat. Then we iterate through the big 
    # array and set all their moods as nervous, and erase their owner's name. We also
    # originally explicitly cleared self.cats and self.dogs, but we don't need need to
    # because setting the owner to nil already does that, so it's redundant. 

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end


end