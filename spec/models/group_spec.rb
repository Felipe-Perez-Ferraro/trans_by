require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = User.create(name: 'Felipe', email: 'example@mail.com', password: 'password',
                        password_confirmation: 'password')
    Group.create(name: 'McDonalds', icon: 'URL', user_id: @user)
  end

  describe 'Foreign keys' do
    it { should belong_to(:user) }
  end

  describe 'Has many...' do
    it { should have_many(:group_operations) }
    it { should have_many(:operations) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:icon) }
    it { should validate_presence_of(:user_id) }
  end
end
