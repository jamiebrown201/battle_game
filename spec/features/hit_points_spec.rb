feature 'hit points' do
  before do
    sign_in_and_play
  end
  scenario 'can view points' do
    expect(page).to have_content 'Mittens: 100HP'
  end
  context 'when attacked' do
    before do
      allow(Kernel).to receive(:rand).and_return(20)
      attack_cycle
    end
    scenario 'it reduces player 2 points' do
      expect(page).to have_content 'Mittens: 80HP'
    end
    scenario 'it reduces player 1 points' do
      attack_cycle
      expect(page).to have_content 'Dave: 80HP'
    end
    scenario 'next it reduces player 2 points' do
      2.times do
        attack_cycle
      end
      expect(page).to have_content 'Mittens: 60HP'
    end
  end

  def attack_cycle
    click_button 'Attack'
    click_button 'Back'
  end
end
