require 'rails_helper'

RSpec.feature 'Splash Index Page', type: :feature do
  before do
    @user = User.create(name: 'Felipe', email: 'example@mail.com', password: 'password',
    password_confirmation: 'password')
    visit root_path
  end
  
  describe 'Splash Index page' do
    it 'Should see the website authentication', js: true do
      expect(page).to have_content('Trans By')
      expect(page).to have_content('Log In')
      expect(page).to have_content('Sign In')
    end
  
    it 'Should see the Log In section', js: true do
      click_link 'Log In'

      expect(page).to have_current_path(new_user_session_path)
    end
    
    it 'Should see the Sign In', js: true do
      click_link 'Sign In'

      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end