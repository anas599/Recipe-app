require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Recipe index' do
    let(:u1) do
      User.create(id: 50,
                  name: 'rails',
                  created_at: '2023-05-22 16:34:29.347120000 +0000',
                  updated_at: '2023-05-22 16:34:29.347120000 +0000',
                  email: 'rails@railsmail.com',
                  password: '111111')
    end
    let(:r1) do
      Recipe.new(name: 'Fried Rice', prep_time: 1, cooking_time: 2, description: 'This is a ...', user_id: u1.id)
    end

    it 'should have the correct name' do
      expect(r1.name).to eq('Fried Rice')
    end

    it 'should have the correct description' do
      expect(r1.description).to eq('This is a ...')
    end

    it 'should have the correct user id' do
      expect(r1.user_id).to eq(u1.id)
    end
    it 'should have a button to remove recipe' do
      expect(r1).to respond_to(:destroy)
    end
  end
  describe 'Recipe show' do
    let(:u2) do
      User.create(id: 50,
                  name: 'rails2',
                  created_at: '2023-05-22 16:34:29.347120000 +0000',
                  updated_at: '2023-05-22 16:34:29.347120000 +0000',
                  email: 'rails2@railsmail.com',
                  password: '111111')
    end
    let(:r1) do
      Recipe.new(name: 'Jollof Rice', prep_time: 2, cooking_time: 3, description: 'This is a new ...', user_id: u2.id)
    end
    it 'should have name of food' do
      expect(r1.name).to eq('Jollof Rice')
    end
    it 'should have preparation time' do
      expect(r1.prep_time).to eq(2)
    end
    it 'should have cooking time' do
      expect(r1.cooking_time).to eq(3)
    end
    it 'should have description' do
      expect(r1.description).to eq('This is a new ...')
    end
    it 'should have a button to delete a recipe' do
      expect(r1).to respond_to(:destroy)
    end
  end
end
