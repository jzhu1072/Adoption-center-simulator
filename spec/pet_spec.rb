
require 'pet'

RSpec.describe Pet do  # Set up Rspec tests
  describe '#initialize' do
    it 'Initialize the pet object' do
      pet = Pet.new("Oreo", "husky", 1)
      expect(pet.name).to eq("Oreo")
      expect(pet.species).to eq("husky")
      expect(pet.age).to eq(1)
    end
  end
end

