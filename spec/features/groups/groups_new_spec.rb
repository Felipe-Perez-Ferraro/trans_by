require 'rails_helper'

RSpec.feature 'Groups New Page', type: :feature do
  before do
    user = User.create(name: 'Felipe', email: 'example@mail.com', password: 'password',
                       password_confirmation: 'password')

    login_as(user)
    visit new_group_path
  end

  describe 'Groups New Page' do
    it 'Should fill the form correctly', js: true do
      fill_in 'Name', with: 'Burger King'
      fill_in 'Icon', with: 'URL'

      click_button 'Add Category'

      expect(page).to have_current_path(groups_path)
      expect(page).to have_css('img')
      expect(page).to have_content('Burger King')
      expect(page).to have_content('$0')
      expect(page).to have_content('Add new Category')
    end
  end
end
