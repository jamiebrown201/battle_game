def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'Dave'
  fill_in :player_2_name, with: 'Mittens'
  # uncheck('Would you like to play against the computer?')
  click_button 'Submit'
end

def sign_in_and_play_computer
  visit('/')
  fill_in :player_1_name, with: 'Dave'
  fill_in :player_2_name, with: 'Computer'
  click_button 'Submit'
end
