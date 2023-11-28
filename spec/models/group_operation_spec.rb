require 'rails_helper'

RSpec.describe GroupOperation, type: :model do
  before do
    @user = User.create(name: 'Felipe', email: 'example@mail.com', password: 'password',
                        password_confirmation: 'password')
    @group = Group.create(name: 'Transaction', icon: 'URL', user_id: @user)
    @operation = Operation.create(name: 'Transaction', amount: 1000, author_id: @user)
    GroupOperation.create(group_id: @group, operation_id: @operation)
  end

  describe 'Foreign keys' do
    it { should belong_to(:group) }
    it { should belong_to(:operation) }
  end
end
