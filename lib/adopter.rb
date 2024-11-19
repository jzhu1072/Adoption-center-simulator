# Represents people looking to adopt

class Adopter
  attr_accessor :name, :interested_species
  
  def initialize(name, interested_species)
    @name = name
    @interested_species = interested_species
  end
end





