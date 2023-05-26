require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Food index' do
    let(:u1) do
      User.create(id: 50,
                  name: 'rails',
                  created_at: '2023-05-22 16:34:29.347120000 +0000',
                  updated_at: '2023-05-22 16:34:29.347120000 +0000',
                  email: 'rails@railsmail.com',
                  password: '111111',
                  password_confirmation: '111111')
    end

    it 'should have the correct name' do
      expect(u1.name).to eq('rails')
    end

    it 'should have the correct email' do
      expect(u1.email).to eq('rails@railsmail.com')
    end

    it 'valid user is valid' do
      expect(u1).to be_valid
    end
  end
end
