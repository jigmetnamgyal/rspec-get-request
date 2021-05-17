require 'rails_helper'

RSpec.describe GamingConsole, type: :model do
  subject {described_class.new(:name => "NES", :manufacturer => 'Nintendo')}

  describe 'Name' do
    describe 'validates' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.name = nil
        expect(subject).to_not be_valid
      end
    end
  end

  describe 'manufacturer' do
    describe 'validation' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.manufacturer = nil
        expect(subject).to_not be_valid
      end
    end

  end

  describe '.nintendo' do
    it 'returns an array of game manufactured by nintendo company' do
      nes =  GamingConsole.create(:name => 'NES', :manufacturer => 'Nintendo')
      switch =  GamingConsole.create(:name => 'SWITCH', :manufacturer => 'Nintendo')
      GamingConsole.create(:name => 'PS5', :manufacturer => 'Sony')
      expect(described_class.nintendo).to contain_exactly(nes, switch)
    end
  end
  describe '#formatted_name' do
    it 'returns combined name of Name of the game and manufacturer' do
      expect(subject.formatted_name).to eql('NES Nintendo')
    end
  end
end
