feature 'Attacking' do
  before do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(20)
    click_button 'Attack'
  end
  scenario 'attack Player 2' do
      expect(page).to have_content 'Dave attacked Mittens'
  end
  scenario 'next attack Player 1' do
      attack_cycle
      expect(page).to have_content 'Mittens attacked Dave'
  end
  scenario 'returns to attacking player 2' do
    2.times do
      click_button 'Back'
      click_button 'Attack'
    end
    expect(page).to have_content 'Dave attacked Mittens'
  end

  scenario 'Player 2 dies on zero hp' do
    click_button 'Back'
    allow(Kernel).to receive(:rand).and_return(100)
    click_button 'Attack'
    expect(page).to have_content 'Dave is DEAD'
    expect(page).not_to have_content 'attacked'
  end

  def attack_cycle
    click_button 'Back'
    click_button 'Attack'
  end
end
