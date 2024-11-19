
require 'adopter'

RSpec.describe Adopter do  # Set up Rspec tests
  describe '#add_adopter' do
    it 'Initialize the adopter object' do
      adopter = Adopter.new("John", "husky")
      expect(adopter.name).to eq("John")
      expect(adopter.interested_species).to eq("husky")

    end
  end
end
