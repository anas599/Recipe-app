require 'rails_helper'

RSpec.describe Recipe, type: :system do
  describe 'Recipe index' do
    let(:u1) do
      User.create(id: 50,
                  name: 'rails',
                  created_at: '2023-05-22 16:34:29.347120000 +0000',
                  updated_at: '2023-05-22 16:34:29.347120000 +0000',
                  email: 'rails@railsmail.com',
                  password: '111111',
                  password_confirmation: '111111')
    end
    let(:f1) { Food.new(name: 'Burger', measure_unit: 'gram(s)', price: 2, quantity: 2, user_id: u1.id) }
    before(:each) do
      f1.save
    end
    before(:each) do
      visit '/recipes'
    end
    it 'Logs in with valid data' do
      fill_in 'Email', with: 'rails@railsmail.com'
      fill_in 'Password', with: '111111'
      click_button('Log in')
      sleep 2
    end
    it 'should have the correct name' do
      fill_in 'Email', with: 'rails@railsmail.com'
      fill_in 'Password', with: '111111'
      click_button('Log in')
      expect(page).to have_content('New recipe')
      sleep 1
      click_link('New recipe')

      fill_in 'Name', with: 'BBQ Burger'
      fill_in 'Prep time', with: 20
      fill_in 'Cooking time', with: 30
      fill_in 'Description', with: 'this is bbq recipe'
      check 'Public'
      click_button('Create Recipe')

      expect(page).to have_content('BBQ Burger')
      expect(page).to have_content('Preparation time: 20')
      expect(page).to have_content('Cooking time: 30')
      expect(page).to have_content('Description: this is bbq recipe')
    end
  end
end
