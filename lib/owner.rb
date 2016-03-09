require 'pry'
class Owner

  attr_accessor :all, :name, :pets, :mood
  attr_reader :species
  @@all = []
  def initialize(species)
  	@pets = {fishes: [], cats: [], dogs: []}
  	@species = species
  	@@all << self
  end

  def self.all
  	@@all
  end

  def self.reset_all
  	all.clear
  end

  def self.count
  	all.size
  end

  def say_species
  	"I am a #{@species}."
  end

  def buy_fish(name)
  	pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
  	pets[:cats] << Cat.new(name)
  end
  
  def buy_dog(name)
  	pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
  	pets[:dogs][0].mood = "happy"
  end

  def play_with_cats
  	pets[:cats][0].mood = "happy"
  end

  def feed_fish
  	pets[:fishes][0].mood = "happy"
  end

  def sell_pets
  	pets.clear
  	Owner.all.each do |each_pet|
			each_pet.mood = "nervous" if each_pet.mood != nil
  	end
  	Owner.reset_all
  end

  def list_pets
	  fish_count = Owner.all[0].pets[:fishes].size
	  dog_count = Owner.all[0].pets[:dogs].size
	  cat_count = Owner.all[0].pets[:cats].size
	  "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
	end
end