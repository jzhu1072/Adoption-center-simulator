# Manages the collection of registered adopters

class Adopter_Registry

  def initialize
    @adopter_registry = []
  end

  def add_adopter(adopter)
    @adopter_registry.append(adopter)
  end

  def remove_adopter(name, interested_species)
    # verifies that the person exists and then removing them from the registry
    @adopter_registry.each do |person|
      if  person[0] == name && person[1] == interested_species
        @adopter_registry.delete(person)
      end
    end
  end

  def find_adopters(preferred_species)
    output = []
    @adopter_registry.each do |person|
      if person[1] == preferred_species
        output << person
      end
    end
    return output 
  end

  # Provides a way to access @adopter_rsegistry outside of this class
  def view_registry
    return @adopter_registry
  end

end