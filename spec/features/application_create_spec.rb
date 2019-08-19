# require 'rails_helper'
#
# RSpec.feature "CreateApplications", type: :feature do
#   feature "User creates a new application" do
#     scenario "by filling out and submitting a new application form" do
#       user = User.create(name: "Grace Hopper",
#                          email: "admiralgrace@googlemail.com",
#                          password: "securepassword")
#       visit login_path
#       fill_in 'session_email', with: user.email
#       fill_in 'session_password', with: user.password
#       click_button 'Sign in'
#
#       expect(current_path).to eq('/companies')
#       expect(page).to have_content('Sign Out')
#       click_link 'Add a New Company'
#
#       expect(current_path).to eq('/companies/new')
#       expect(page).to have_content("Name Street Address City State Zip Phone Contact Person")
#       fill_in 'company_name', with: "Planet Argon"
#       fill_in 'company_address_street_address', with: "3530 N Vancouver Ave, Suite 300"
#       fill_in 'company_address_city', with: "Portland"
#       fill_in 'company_address_state', with: "OR"
#       fill_in 'company_address_zip_code', with: 97227
#       fill_in 'company_telephone_number', with: 503-847-9214
#       fill_in 'company_contact_person', with: "Robby Russell"
#       click_button 'Submit company'
#
#       expect(Company.last.name).to eq("Planet Argon")
#       expect(user.companies.last.name).to eq("Planet Argon")
#       expect(user.companies.count).to eq(1)
#       expect(Application.last.user_id).to eq(user.id)
#       expect(Application.last.company_id).to eq(Company.last.id)
#       expect(Application.last.company_name).to eq("Planet Argon")
#
#       expect(current_path).to eq('/companies')
#       visit(edit_company_application_path(company_id: user.companies.last.id, id: user.companies.last.id))
#       expect(current_path).to eq('/companies/#{company.last.id}/edit')
#       fill_in 'application_date', with: '2019-10-22'
#       click_button "Submit"
#
#       expect(user.applications.last.company_name).to eq("Planet Argon")
#       expect(Company.last.applications.last.company_name).to eq("Planet Argon")
#       expect(User.last.applications.count).to eq(1)
#       expect(current_path).to eq('/companies/10/applications/8')
#       expect(page).to have_content('Planet Argon')
#     end
#   end
# end
