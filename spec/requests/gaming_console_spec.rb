require 'rails_helper'

RSpec.describe 'GamingConsole requests', type: :request do
  before do
    GamingConsole.create(:name => 'NES', :manufacturer => 'Nintendo')
    GamingConsole.create(:name => 'SWITCH', :manufacturer => 'Nintendo')
    GamingConsole.create(:name => 'PS5', :manufacturer => 'Sony')
  end

  describe 'GET /games' do
    context 'If param is not present' do
      it 'returns an array of the game' do
        get('/games')
        expect(jsonParse['gamingConsoles']).to contain_exactly('NES', 'SWITCH', 'PS5')
      end
    end

    context 'If there is param' do
      it 'returns specific type of gaming consoles' do
        get('/games', params: {:manufacturer => 'Nintendo'})
        expect(jsonParse['gamingConsoles']).to contain_exactly('NES', 'SWITCH')
      end
    end



  end

end
