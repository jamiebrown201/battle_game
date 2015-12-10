feature 'hit points' do
  scenario 'can view points' do
    visit('/')
    sign_in_and_play
    expect(page).to have_content 'Mittens: 100HP'
  end
  context 'when attacked' do
    scenario 'it reduces points' do
      sign_in_and_play
      click_button 'Attack'
      click_button 'Back'
      expect(page).to have_content 'Mittens: 80HP'
    end
  end
end
