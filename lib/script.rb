
# demo of all classes

require_relative 'pet'
require_relative 'adopter'
require_relative 'adopter_registry'
require_relative 'pet_inventory'
require_relative 'adoption_center'

# Add pets ------------------
adoption_center = Adoption_center.new
adoption_center.add_pets("Oreo", "husky", 1)
adoption_center.add_pets("Spike", "bulldog", 2)
adoption_center.add_pets("Kitty", "kitten", 3)
adoption_center.add_pets("Poppy", "husky", 4)

# Add adopters ------------------
adoption_center.add_adopter("John", "kitten")
adoption_center.add_adopter("Smith", "husky")
adoption_center.add_adopter("Doe", "husky")
adoption_center.add_adopter("Jane", "fish")


# Find pets and adopters ------------------
adoption_center.find_pets("bulldog")
adoption_center.find_adopters("husky")

# Pets belonging to bulldog
# Name: Spike, Species: bulldog, Age: 2

# Adopters interested in husky:
# Name: Smith, Interested species: husky
# Name: Doe, Interested species: husky


# View available pets and adopters BEFORE adoption process ------------------
adoption_center.view_inventory
adoption_center.view_registry

# Available pets:
# Name: Oreo, Species: husky, Age: 1
# Name: Spike, Species: bulldog, Age: 2
# Name: Kitty, Species: kitten, Age: 3
# Name: Poppy, Species: husky, Age: 4

# Available adopters:
# Name: John, Interested species: kitten
# Name: Smith, Interested species: husky
# Name: Doe, Interested species: husky
# Name: Jane, Interested species: fish


# Find match ------------------
adoption_center.match_adopter

# Begin adoption process
# ["John", "kitten"] matched with ["Kitty", "kitten", 3], adoption completed
# ["Smith", "husky"] matched with ["Oreo", "husky", 1], adoption completed
# ["Doe", "husky"] matched with ["Poppy", "husky", 4], adoption completed


# View available pets and adopters AFTER adoption process ------------------
adoption_center.view_inventory
adoption_center.view_registry

# Available pets:
# Name: Spike, Species: bulldog, Age: 2

# Available adopters:
# Name: Jane, Interested species: fish