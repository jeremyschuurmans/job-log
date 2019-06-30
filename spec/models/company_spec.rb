require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: "Grace Hopper",
                       email: "admiralgrace@googlemail.com",
                       password: "securepassword")

    application = Application.create(company: "Codeco", date: 06/29/2019, followup: false)

    company = Company.create(name: "Codeco",
                             address: "123 Avenue St",
                             telephone_number: "503-555-5555",
                             contact_person: "Steve Jobs",
                             user_id: user.id,
                             application_id: application.id)

    expect(company).to be_valid
  end

  it 'is invalid without a name' do
    user = User.create(name: "Grace Hopper",
                       email: "admiralgrace@googlemail.com",
                       password: "securepassword")

    application = Application.create(company: "Codeco", date: 06/29/2019, followup: false)

    company = Company.create(name: "",
                             address: "123 Avenue St",
                             telephone_number: "503-555-5555",
                             contact_person: "Steve Jobs",
                             user_id: user.id,
                             application_id: application.id)

    expect(company).to be_invalid
  end

  it 'is invalid without an address' do
    user = User.create(name: "Grace Hopper",
                       email: "admiralgrace@googlemail.com",
                       password: "securepassword")

    application = Application.create(company: "Codeco", date: 06/29/2019, followup: false)

    company = Company.create(name: "Codeco",
                             address: "",
                             telephone_number: "503-555-5555",
                             contact_person: "Steve Jobs",
                             user_id: user.id,
                             application_id: application.id)

    expect(company).to be_invalid
  end

  it 'is invalid without a telephone number' do
    user = User.create(name: "Grace Hopper",
                       email: "admiralgrace@googlemail.com",
                       password: "securepassword")

    application = Application.create(company: "Codeco", date: 06/29/2019, followup: false)

    company = Company.create(name: "Codeco",
                             address: "123 Avenue St",
                             telephone_number: "",
                             contact_person: "Steve Jobs",
                             user_id: user.id,
                             application_id: application.id)

     expect(company).to be_invalid
   end

  it 'is invalid without a contact person' do
    user = User.create(name: "Grace Hopper",
                       email: "admiralgrace@googlemail.com",
                       password: "securepassword")

    application = Application.create(company: "Codeco", date: 06/29/2019, followup: false)

    company = Company.create(name: "Codeco",
                             address: "123 Avenue St",
                             telephone_number: "503-555-5555",
                             contact_person: "",
                             user_id: user.id,
                             application_id: application.id)

     expect(company).to be_invalid
  end
end
