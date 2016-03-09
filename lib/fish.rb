require 'pry'
class Fish
  # code goes here
# binding.pry
  attr_accessor :mood
  attr_reader :name

  def initialize(name)
  	@name = name
  	@mood = "nervous"
  	Owner.all << self
  end
end