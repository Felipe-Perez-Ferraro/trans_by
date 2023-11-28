require 'rails_helper'

RSpec.feature 'Groups Index Page', type: :feature do
  before do
    user = User.create(name: 'Felipe', email: 'example@mail.com', password: 'password',
    password_confirmation: 'password')
    @group = Group.create(name: 'McDonalds', icon: 'URL', user:)
    login_as(user)
    visit groups_path
  end

  describe 'Groups Index Page' do 
    it 'Should see the groups', js: true do
      expect(page).to have_css('img')
      expect(page).to have_content('McDonalds')
      expect(page).to have_content('$0')
      expect(page).to have_content('Add new Category')
    end

    it 'Should redirect me to details page', js: true do 
      find('.details_link', match: :first).click

      expect(page).to have_current_path(group_path(@group))
    end

    it 'Should redirect me to new Category page', js: true do 
      click_link 'Add new Category'

      expect(page).to have_current_path(new_group_path)
    end
  end
end