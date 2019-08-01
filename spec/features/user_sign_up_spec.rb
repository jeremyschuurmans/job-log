require 'rails_helper'

RSpec.feature "UserSignUps", type: :feature do

  feature 'User Signs Up' do
    scenario 'with valid name, email, and password' do
      visit signup_path
      fill_in 'user_name', with: 'Ada Lovelace'
      fill_in 'user_email', with: 'ada@googlemail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Sign Up'

      expect(current_path).to eq('/companies')
      expect(page).to have_content('Sign Out')
    end

    scenario 'with invalid email and password' do
      visit signup_path
      fill_in 'user_name', with: 'Ada Lovelace'
      click_button 'Sign Up'

      expect(current_path).to eq('/signup')
      expect(page).to have_content('Sign Up')
    end
  end

  feature 'Same User Cannot Sign Up Twice' do
    scenario 'with valid name, email, and password, does not persist and redirects to /login' do
      visit signup_path
      fill_in 'user_name', with: 'Ada Lovelace'
      fill_in 'user_email', with: 'ada@googlemail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Sign Up'

      expect(current_path).to eq('/companies')
      expect(page).to have_content('Sign Out')

      visit signup_path
      fill_in 'user_name', with: 'Ada Lovelace'
      fill_in 'user_email', with: 'ada@googlemail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Sign Up'
      expect(current_path).to eq('/login')
      expect(page).to have_content('Log In')
    end
  end
end
