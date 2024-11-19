# Represents individual pets.

class Pet
  attr_accessor :name, :species, :age
  
  def initialize(name, species, age)
    @name = name
    @species = species
    @age = age
  end
end

