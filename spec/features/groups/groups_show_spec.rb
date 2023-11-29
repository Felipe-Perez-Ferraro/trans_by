require 'rails_helper'

RSpec.feature 'Groups Show Page', type: :feature do
  before do
    user = User.create(name: 'Felipe', email: 'example@mail.com', password: 'password',
                       password_confirmation: 'password')
    @group = Group.create(name: 'McDonalds', icon: 'URL', user:)

    login_as(user)
    visit group_path(@group)
  end

  describe 'Groups Show Page' do
    it 'Should see the group detail', js: true do
      expect(page).to have_css('img')
      expect(page).to have_content('McDonalds')
      expect(page).to have_content('Total: $0')
      expect(page).to have_content('Add new Transaction')
    end

    it 'Should redirect me to new Transaction page', js: true do
      click_link 'Add new Transaction'

      expect(page).to have_current_path(new_group_operation_path(@group))
    end
  end
end
