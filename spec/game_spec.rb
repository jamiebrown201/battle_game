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
  describe '#switch' do
    it 'player 1 has switched' do
      game.switch
      expect(game.player_1).to eq mittens
    end
    it 'player 2 has switched' do
      game.switch
      expect(game.player_2).to eq dave
    end
  end
  describe '#death_occurred?' do
    it 'is true when player 1 is dead' do
      allow(dave).to receive(:hp).and_return(0)
      expect(game.death_occurred?).to eq true
    end
    it 'is true when player 2 is dead' do
      allow(dave).to receive(:hp).and_return(0)
      expect(game.death_occurred?).to eq true
    end
    it 'is false when no player is dead' do
      allow(dave).to receive(:hp).and_return(10)
      allow(mittens).to receive(:hp).and_return(10)
      expect(game.death_occurred?).to eq false
    end
  end
end
