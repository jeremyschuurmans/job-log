require 'rails_helper'

RSpec.feature "CreateApplications", type: :feature do
  feature "User creates a new application" do
    scenario "by filling out and submitting a new application form" do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")
      visit login_path
      fill_in 'session_email', with: user.email
      fill_in 'session_password', with: user.password
      click_button 'Log In'

      expect(current_path).to eq('/companies')
      expect(page).to have_content('Sign Out')
      click_link 'Add a New Company'

      expect(current_path).to eq('/companies/new')
      expect(page).to have_content("Name Address Phone Contact Person")
      fill_in 'company_name', with: "Planet Argon"
      fill_in 'company_address', with: "3530 N Vancouver Ave, Suite 300, Portland, OR 97227"
      fill_in 'company_telephone_number', with: 503-847-9214
      fill_in 'company_contact_person', with: "Robby Russell"
      click_button 'Submit Company'

      expect(Company.last.name).to eq("Planet Argon")
      expect(user.companies.last.name).to eq("Planet Argon")
      expect(user.companies.count).to eq(1)
      expect(Application.last.user_id).to eq(user.id)
      expect(Application.last.company_id).to eq(Company.last.id)
      expect(Application.last.company_name).to eq(nil)

      expect(current_path).to eq('/companies/1')
      click_link 'Add a New Application'
      expect(current_path).to eq('/companies/1/applications/new')
      expect(page).to have_content("Submit Application")
      find('#application_company_name').find(:xpath, 'Planet Argon').select_option

    end
  end
end
