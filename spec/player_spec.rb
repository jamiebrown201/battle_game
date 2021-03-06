require 'player'

describe Player do
  subject(:dave) { Player.new('Dave') }
  subject(:mittens) { Player.new('Mittens') }

  describe '#name' do
    it 'returns the name' do
      expect(dave.name).to eq 'Dave'
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(dave.hp).to eq described_class::DEFAULT_HP
    end
  end

describe '#computer?' do
  it 'by default, player is computerized' do
    expect(mittens.computer?).to eq false
  end
  subject(:computer){Player.new('Computer', Player::DEFAULT_HP, true)}
  it 'tells if player has been computerized' do
    expect(computer.computer?).to eq true
  end
end


  describe '#receive_damage' do
    it 'reduces the player hit points' do
      allow(Kernel).to receive(:rand).and_return(20)
      expect { dave.receive_damage }.to change { dave.hp }.by(-20)
    end
  end
 end
