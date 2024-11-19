
require 'adoption_center'

RSpec.describe Adoption_center do  # Set up Rspec tests
  let (:center) {Adoption_center.new}
  describe '#initialize' do
    it 'Initializes 2 empty arrays and creates new inventory and registry' do
      expect(center.instance_variable_get(:@all_pets)).to eq([])
      expect(center.instance_variable_get(:@all_adopters)).to eq([])
      # expect(center.instance_variable_get(:@pet_inventory)).to eq([Pet_Inventory.new])
      # expect(center.instance_variable_get(:@adopter_registry)).to eq([Adopter_Registry.new])
    end   
  end

  #----- Add pets and adopters
  describe '#add_pets' do
    it 'Add pet to both @all_pets and @pet_inventory' do
      center.add_pets("Oreo", "husky", 1)
      center.add_pets("Spike", "bulldog", 2)
      expect(center.instance_variable_get(:@all_pets)).to eq([["Oreo", "husky", 1], ["Spike", "bulldog", 2]])
      # .view_inventory returns the @pet_inventory array
      expect(center.view_inventory).to eq([["Oreo", "husky", 1], ["Spike", "bulldog", 2]])
    end   
  end

  describe '#add_adopter' do
    it 'Add adopter to both @all_adopters and @adopter_registry' do
      center.add_adopter("John", "kitten")
      center.add_adopter("Smith", "husky")
      expect(center.instance_variable_get(:@all_adopters)).to eq([["John", "kitten"], ["Smith", "husky"]])
      # .view_registry returns the @adopter_registry array
      expect(center.view_registry).to eq([["John", "kitten"], ["Smith", "husky"]])
    end   
  end

  #-----  View available pets and adopters ----- 
  describe '#view_inventory' do  # Before adoption process
    it 'returns all available pets in the inventory' do
      center.add_pets("Oreo", "husky", 3)
      center.add_pets("Spike", "bulldog", 4)
      expect(center.view_inventory).to eq([["Oreo", "husky", 3], ["Spike", "bulldog", 4]])
    end   
  end

  describe '#view_registry' do  # Before adoption process
    it 'returns all registered adopters in the registry' do
      center.add_adopter("Jane", "kitten")
      center.add_adopter("Smith", "husky")
      expect(center.view_registry).to eq([["Jane", "kitten"], ["Smith", "husky"]])
    end   
  end

  #-----  Find available pets and adopters
  describe '#find_pets' do  
    it 'returns all available pets that match the given species' do
      center.add_pets("Oreo", "husky", 3)
      center.add_pets("Spike", "bulldog", 4)
      center.add_pets("Hugo", "husky", 5)
      expect(center.find_pets("husky")).to eq([["Oreo", "husky", 3], ["Hugo", "husky", 5]])
    end   
  end

  describe '#find_adopters' do  
    it 'returns all registered adopters that match their preferred species' do
      center.add_adopter("Jane", "kitten")
      center.add_adopter("Smith", "husky")
      center.add_adopter("Jone", "kitten")
      expect(center.find_adopters("kitten")).to eq([["Jane", "kitten"], ["Jone", "kitten"]])
    end   
  end

  #-----  Match available pets and adopters
  describe '#match_adopter' do  
    it 'match a adopter to a pet of their preferred species' do
      center.add_pets("Oreo", "husky", 3)
      center.add_pets("Spike", "bulldog", 4)

      center.add_adopter("Jane", "kitten")
      center.add_adopter("Smith", "husky")
      expect{center.match_adopter}.to output("\nBegin adoption process\n[\"Smith\", \"husky\"] matched with [\"Oreo\", \"husky\", 3], adoption completed\n").to_stdout
    end   
  end

  describe '#view_inventory' do  # AFTER adoption process
    it 'returns all available pets in the inventory' do
      center.add_pets("Oreo", "husky", 3)
      center.add_pets("Spike", "bulldog", 4)

      center.add_adopter("Jane", "kitten")
      center.add_adopter("Smith", "husky")
      center.match_adopter
      expect(center.view_inventory).to eq([["Spike", "bulldog", 4]])
    end   
  end

  describe '#view_registry' do  # AFTER adoption process
    it 'returns all registered adopters in the registry' do
      center.add_pets("Oreo", "husky", 3)
      center.add_pets("Spike", "bulldog", 4)

      center.add_adopter("Jane", "kitten")
      center.add_adopter("Smith", "husky")
      center.match_adopter
      expect(center.view_registry).to eq([["Jane", "kitten"]])
    end   
  end
end