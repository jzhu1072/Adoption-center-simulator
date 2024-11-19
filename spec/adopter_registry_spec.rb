
require 'adopter_registry'

RSpec.describe Adopter_Registry do  # Set up Rspec tests
  let (:registry) {Adopter_Registry.new}
  describe '#initialize' do
    it 'Initializes an empty array' do
      expect(registry.instance_variable_get(:@adopter_registry)).to eq([])
    end   
  end

  describe '#add_adopter' do
    it 'Add adopter to @adopter_registry array' do
      registry.add_adopter(["John", "husky"])
      expect(registry.instance_variable_get(:@adopter_registry)).to eq([["John", "husky"]])
    end
  end

  describe '#remove_adopter' do
    it 'Remove adopter in the @adopter_registry array' do
      registry.add_adopter(["John", "husky"])
      registry.add_adopter(["Doe", "bulldog"])
      registry.remove_adopter("John", "husky")
      expect(registry.instance_variable_get(:@adopter_registry)).to eq([["Doe", "bulldog"]])
    end
  end

  describe '#find_adopters' do
    it 'Find adopters in the @adopter_registry array' do
      registry.add_adopter(["John", "husky"])
      registry.add_adopter(["Doe", "husky"])
      registry.add_adopter(["Jane", "fish"])
      registry.find_adopters("husky")
      expect(registry.find_adopters("husky")).to eq([["John", "husky"], ["Doe", "husky"]])
    end
  end

  describe '#view_registry' do
    it 'List all the adopters in @adopter_registry' do
      registry.add_adopter(["John", "husky"])
      registry.add_adopter(["Doe", "husky"])
      registry.add_adopter(["Jane", "fish"])
      expect(registry.view_registry).to eq([["John", "husky"], ["Doe", "husky"], ["Jane", "fish"]])
    end
  end
end