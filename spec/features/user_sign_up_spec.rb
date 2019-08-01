require 'rails_helper'

RSpec.feature "UserSignUps", type: :feature do

  feature 'User Signs Up' do
    scenario 'with valid name, email, and password' do
      visit signup_path
      fill_in 'Name', with: 'Ada Lovelace'
      fill_in 'Email', with: 'ada@googlemail.com'
      fill_in 'Password', with: 'password'
      click_button 'Sign Up'

      current_path.should == "/companies/index"
      expect(page).to have_content('Sign Out')
    end
  end
end
