require 'rails_helper'

RSpec.describe Food, type: :model do
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
    let(:f1) { Food.create(name: 'Burger', measure_unit: 'gram(s)', price: 2, quantity: 2, user_id: u1.id) }
    before(:each) do
      u1.save
      f1.save
    end
    it 'should have the correct name' do
      expect(f1.name).to eq('Burger')
    end
    it 'should have the correct name' do
      expect(u1.name).to eq('rails')
    end

    it 'should have the correct measure unit' do
      expect(f1.measure_unit).to eq('gram(s)')
    end

    it 'should have the correct price' do
      expect(f1.price).to eq(2)
    end

    it 'should have the correct quantity' do
      expect(f1.quantity).to eq(2)
    end

    it 'should have the correct user id' do
      expect(f1.user_id).to eq(u1.id)
    end
    it 'should have a button to create a new food' do
      expect(f1.save).to eq(true)
    end
  end
  describe 'Food show' do
    let(:u2) do
      User.create(id: 50,
                  name: 'rails2',
                  created_at: '2023-05-22 16:34:29.347120000 +0000',
                  updated_at: '2023-05-22 16:34:29.347120000 +0000',
                  email: 'rails2@railsmail.com',
                  password: '111111',
                  password_confirmation: '111111')
    end
    let(:f1) { Food.new(name: 'Burger', measure_unit: 'gram(s)', price: 2, quantity: 2, user_id: u2.id) }
    it 'should have name of food' do
      expect(f1.name).to eq('Burger')
    end
    it 'should have measute unit of food' do
      expect(f1.measure_unit).to eq('gram(s)')
    end
    it 'should have price of food' do
      expect(f1.price).to eq(2)
    end
    it 'should have quantity of food' do
      expect(f1.quantity).to eq(2)
    end
  end
end
