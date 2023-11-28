require 'rails_helper'

RSpec.describe Operation, type: :model do
  before do
    @user = User.create(name: 'Felipe', email: 'example@mail.com', password: 'password',
                        password_confirmation: 'password')
    Operation.create(name: 'Transaction', amount: 1000, author_id: @user)
  end

  describe 'Foreign keys' do
    it { should belong_to(:user) }
  end

  describe 'Has many...' do
    it { should have_many(:group_operations) }
    it { should have_many(:groups) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
    it { should validate_presence_of(:author_id) }
  end
end
