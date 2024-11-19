# Coordinates the overall operations (adding pets, 
# registering adopters, processing adoptions, etc.)

# o Your program should show lists of available pets and registered
#   adopters, both before and after an adoption.

# o When trying to match a pet to an adopter, it should display whether
#   a match was found and who the adopter is.

# o After an adoption, it should indicate whether the adoption was
#   successful or if it failed

require_relative 'pet'
require_relative 'adopter'
require_relative 'adopter_registry'
require_relative 'pet_inventory'

class Adoption_center

  def initialize
    @all_pets = [] # pets availiable before and after adoption
    @all_adopters = [] # adopters availiable before and after adoption

    @pet_inventory = Pet_Inventory.new # pets availiable AFTER adoption
    @adopter_registry = Adopter_Registry.new # adopters availiable AFTER adoption
  end
  
#----- Add pets and adopters
  def add_pets(name, species, age) 
    pet = Pet.new(name, species, age)
    @all_pets.append([pet.name, pet.species, pet.age])
    @pet_inventory.add_pets([pet.name, pet.species, pet.age])
  end

    # remove pets and adopters when an adoption is complete,
    # no need to put them out separately

  def add_adopter(name, interested_species)
    adopter = Adopter.new(name, interested_species)
    @all_adopters.append([adopter.name, adopter.interested_species])
    @adopter_registry.add_adopter([adopter.name, adopter.interested_species])
  end

#-----  View available pets and adopters 
  def view_inventory
    puts "\nAvailable pets:"
    (@pet_inventory.view_inventory).each do |pet|  
      puts "Name: #{pet[0]}, Species: #{pet[1]}, Age: #{pet[2]}\n"
    end
  end

  def view_registry
    puts "\nAvailable adopters:"
    (@adopter_registry.view_registry).each do |adopter|  
      puts "Name: #{adopter[0]}, Interested species: #{adopter[1]}\n"
    end
  end

#-----  Find available pets and adopters
  def find_pets(species)
    puts "\nPets belonging to #{species}"
    result = @pet_inventory.find_pets(species)
    result.each do |pet|  
      puts "Name: #{pet[0]}, Species: #{pet[1]}, Age: #{pet[2]}\n"
    end
  end

  def find_adopters(interested_species)
    puts "\nAdopters interested in #{interested_species}:"
    result = @adopter_registry.find_adopters(interested_species)
    result.each do |adopter|  
      puts "Name: #{adopter[0]}, Interested species: #{adopter[1]}\n"
    end
  end

#-----  Match available pets and adopters
  def match_adopter
    # all_adopters = [ [name, interested_species], ... ]
    # all_pets = [ [name, species, age], ... ]
    puts "\nBegin adoption process"
    boo = false
    @all_adopters.each do |adopter|
      @all_pets.each do |pet|
        if adopter[1] == pet[1] &&  # ensure that pets and adopter are available
          @adopter_registry.view_registry.include?(adopter) && 
          @pet_inventory.view_inventory.include?(pet)
          boo = true # indicates a successful adoption

          # removes pets and adopter once they match
          @adopter_registry.remove_adopter(adopter[0], adopter[1])
          @pet_inventory.remove_pet(pet[0], pet[1], pet[2])
          puts "#{adopter} matched with #{pet}, adoption completed"
          break  # move on to the next adopter
        end
      end
    end

    # if no matches are found...
    if boo == false
      puts "No matches found, adoption failed"
    end
  end
end
