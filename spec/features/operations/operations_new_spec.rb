require 'rails_helper'

RSpec.feature 'Operations New Page', type: :feature do
  before do
    user = User.create(name: 'Felipe', email: 'example@mail.com', password: 'password',
    password_confirmation: 'password')
    @group = Group.create(name: 'McDonalds', icon: 'URL', user:)

    login_as(user)
    visit new_group_operation_path(@group)
  end
  
  describe 'Operations New Page' do 
    it 'Should fill the form correctly', js: true do 
      fill_in 'Name', with: 'Transaction'
      fill_in 'Amount', with: '10'
      
      click_button 'Add Transaction'
      
      expect(page).to have_current_path(group_path(@group))
      expect(page).to have_css('img')
      expect(page).to have_content('McDonalds')
      expect(page).to have_content('Total: $10')
      expect(page).to have_content('Transaction Nº')
      expect(page).to have_content('TOTAL PAYMENT')
      expect(page).to have_content('$10')
      expect(page).to have_content('Add new Transaction')
    end
  end
end