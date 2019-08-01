require 'rails_helper'

RSpec.feature "UserLogIns", type: :feature do

  feature 'User Logs In' do
    scenario 'with valid email and password' do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")
      visit login_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log In'

      expect(current_path).to eq('/companies')
      expect(page).to have_content('Sign Out')
    end
  end

end
