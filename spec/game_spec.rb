require 'game'

describe Game do
  subject(:game) { described_class.new(dave, mittens) }
  let(:dave) { double(:player_1)}
  let(:mittens) { double(:player_2)}
  describe '#attack' do
    it 'damages the player' do
      expect(mittens).to receive(:receive_damage)
      game.attack(mittens)
    end
  end
  describe '#player_1' do
    it 'returns player 1' do
      expect(game.player_1).to eq dave
    end
  end
  describe '#player_2' do
    it 'returns player 2' do
      expect(game.player_2).to eq mittens
    end
  end
end
