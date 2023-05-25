require 'rails_helper'

RSpec.describe Food, type: :system do
  describe 'Food index' do
    let(:u1) do
      User.create(id: 50,
                  name: 'rails',
                  created_at: '2023-05-22 16:34:29.347120000 +0000',
                  updated_at: '2023-05-22 16:34:29.347120000 +0000',
                  email: 'rails@railsmail.com',
                  password: '111111')
    end
    let(:f1) do
      Food.new(name: 'Burger', measure_unit: 'Gram', price: 2, quantity: 2, user_id: u1.id)
    end
    let(:r1) do
      Recipe.create(id: 12,
                    name: 'BBQ Burger',
                    created_at: '2023-05-22 16:34:29.347120000 +0000',
                    updated_at: '2023-05-22 16:34:29.347120000 +0000',
                    prep_time: 20,
                    cooking_time: 30,
                    description: 'this is bbq recipe',
                    public: true, user_id: u1.id)
    end

    before(:each) do
      u1.save
      f1.save
      r1.save
    end

    before(:each) do
      visit '/foods'
    end

    it 'Logs in with valid data' do
      fill_in 'Email', with: 'rails@railsmail.com'
      fill_in 'Password', with: '111111'
      click_button('Log in')
      sleep 1
    end
    it 'should save recipe' do
      expect(r1.persisted?).to be(true)
    end
    it 'should have the correct name' do
      fill_in 'Email', with: 'rails@railsmail.com'
      fill_in 'Password', with: '111111'
      click_button('Log in')
      expect(page).to have_content('Burger')
      sleep 1
    end

    it 'should have public recipes item' do
      fill_in 'Email', with: 'rails@railsmail.com'
      fill_in 'Password', with: '111111'
      click_button('Log in')
      sleep 1
      visit '/public_recipes/'
      sleep 2
      expect(page).to have_content('BBQ Burger')
      expect(page).to have_content('Total Price')
      expect(page).to have_content('Total Food Items')
      expect(page).to have_content(u1.name)
    end
  end
end
