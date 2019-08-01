require 'rails_helper'

RSpec.feature "UserLogIns", type: :feature do

  feature 'User logs in' do
    scenario 'with valid email and password' do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")

      visit login_path
      fill_in 'session_email', with: user.email
      fill_in 'session_password', with: user.password
      click_button 'Log In'

      expect(current_path).to eq('/companies')
      expect(page).to have_content('Sign Out')
    end

    scenario 'with invalid email or password' do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")

      visit login_path
      fill_in 'session_email', with: 'bob@bob.com'
      fill_in 'session_password', with: 'bobspassword'
      click_button 'Log In'

      expect(current_path).to eq('/login')
      expect(page).to have_content('Log In')
    end
  end

end
