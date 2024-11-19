# Manages the collection of pets available for adoption

class Pet_Inventory

  def initialize
    @pet_inventory = []
  end

  def add_pets(pet) 
    @pet_inventory.append(pet)
  end

  def remove_pet(name, species, age)
    # verifies that the pet exists and then removing them from the inventory
    @pet_inventory.each do |pet|
      if pet[0] == name && pet[1] == species && pet[2] == age     
        @pet_inventory.delete(pet)  # remove the pet
      end
    end
  end

  def find_pets(species)
    arr = []
    @pet_inventory.each do |pet|  # pet = [ [name, species, age] ]
      if pet[1] == species  # if species match, add it to output
        arr << pet
      end
    end
    return arr
  end

  def view_inventory
    return @pet_inventory
  end
  
end