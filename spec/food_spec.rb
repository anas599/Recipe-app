require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Food index' do
    let(:u1) { User.first }
    let(:f1) { Food.new(name: 'Burger', measure_unit: 'Gram', price: 2, quantity: 2, user_id: u1.id) }

    it 'should have the correct name' do
      expect(f1.name).to eq('Burger')
    end

    it 'should have the correct measure unit' do
      expect(f1.measure_unit).to eq('Gram')
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
  end
end
