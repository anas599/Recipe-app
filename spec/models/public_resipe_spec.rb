require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Public recipe' do
    let(:u1) do
      User.create(id: 50,
                  name: 'rails',
                  created_at: '2023-05-22 16:34:29.347120000 +0000',
                  updated_at: '2023-05-22 16:34:29.347120000 +0000',
                  email: 'rails@railsmail.com',
                  password: '111111')
    end
    let(:f1) { Food.new(name: 'Burger', measure_unit: 'Gram', price: 2, quantity: 2, user_id: u1.id) }
    let(:r1) do
      Recipe.create(id: 12,
                    name: 'BBQ Burger',
                    created_at: '2023-05-22 16:34:29.347120000 +0000',

                    updated_at: '2023-05-22    16:34:29.347120000 +0000',
                    prep_time: 20,
                    cooking_time: 30,
                    description: 'this is bbq recipe',
                    public: true,
                    user_id: 50)
    end

    it 'should have the correct name' do
      expect(f1.name).to eq('Burger')
    end
    it 'should have the correct name' do
      expect(u1.name).to eq('rails')
    end
    it 'should have name of recipe' do
      expect(r1.name).to eq('BBQ Burger')
    end
  end
end
