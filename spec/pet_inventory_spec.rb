
require 'pet_inventory'

RSpec.describe Pet_Inventory do  # Set up Rspec tests
  let (:inventory) {Pet_Inventory.new}
  describe '#initialize' do
    it 'Initializes an empty array' do
      expect(inventory.instance_variable_get(:@pet_inventory)).to eq([])
    end   
  end

  describe '#add_pets' do
    it 'Add pet to @pet_inventory array' do
      inventory.add_pets(["Oreo", "husky", 1])
      expect(inventory.instance_variable_get(:@pet_inventory)).to eq([["Oreo", "husky", 1]])
    end
  end

  describe '#remove_pet' do
    it 'Remove pet in the @pet_inventory array' do
      inventory.add_pets(["Oreo", "husky", 1])
      inventory.add_pets(["Spike", "bulldog", 3])
      inventory.remove_pet("Oreo", "husky", 1)
      expect(inventory.instance_variable_get(:@pet_inventory)).to eq([["Spike", "bulldog", 3]])
    end
  end

  describe '#find_pets' do
    it 'Find pets in the @pet_inventory array' do
      inventory.add_pets(["Oreo", "husky", 1])
      inventory.add_pets(["Spike", "husky", 2])
      inventory.add_pets(["Blob", "fish", 1])
      inventory.find_pets("husky")

      expect(inventory.find_pets("husky")).to eq([["Oreo", "husky", 1], ["Spike", "husky", 2]])
    end
  end

  describe '#view_inventory' do
    it 'List all the pets in @pet_inventory' do
      inventory.add_pets(["Oreo", "husky", 1])
      inventory.add_pets(["Spike", "husky", 2])
      inventory.add_pets(["Blob", "fish", 1])

      expect(inventory.view_inventory).to eq([["Oreo", "husky", 1], ["Spike", "husky", 2], ["Blob", "fish", 1]])
    end
  end
end