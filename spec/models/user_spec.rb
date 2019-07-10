require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'validations' do
    it 'is valid if it has valid attributes' do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")

      expect(user).to be_valid
      user.delete
    end

    it 'is invalid without a name' do
      user = User.create(name: "",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")

      expect(user).to be_invalid
      user.delete
    end

    it 'is invalid without an email' do
      user = User.create(name: "Grace Hopper",
                         email: "",
                         password: "secure_password")

      expect(user).to be_invalid
      user.delete
    end

    it 'is invalid without a password' do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "")

      expect(user).to be_invalid
      user.delete
    end

    it 'has a secure password' do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")

      expect(user.authenticate("notsecurepassword")).to eq(false)
      expect(user.authenticate("securepassword")).to eq(user)
    end
  end

  describe 'associations' do
    it 'has many companies' do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "password")

      application_1 = Application.create(company: "Codeco", date: 06/29/2019, followup: false)

      application_2 = Application.create(company: "Braeburn", date: 06/29/2019, followup: false)


      company_1 = Company.create(name: "Codeco",
                                 address: "123 Avenue St",
                                 telephone_number: "503-555-5555",
                                 contact_person: "Steve Jobs",
                                 user_id: user.id,
                                 application_id: application_1.id)

      company_2 = Company.create(name: "Braeburn",
                                 address: "123 Apple St",
                                 telephone_number: "503-555-5555",
                                 contact_person: "Steve Gates",
                                 user_id: user.id,
                                 application_id: application_2.id)

      expect(user.companies.first).to eq(company_1)
      expect(user.companies.last).to eq(company_2)
    end

    it 'has many applications through companies' do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "password")

      application_1 = Application.create(company: "Codeco", date: 06/29/2019, followup: false)

      application_2 = Application.create(company: "Braeburn", date: 06/29/2019, followup: false)


      company_1 = Company.create(name: "Codeco",
                                 address: "123 Avenue St",
                                 telephone_number: "503-555-5555",
                                 contact_person: "Steve Jobs",
                                 user_id: user.id,
                                 application_id: application_1.id)

      company_2 = Company.create(name: "Braeburn",
                                 address: "123 Apple St",
                                 telephone_number: "503-555-5555",
                                 contact_person: "Steve Gates",
                                 user_id: user.id,
                                 application_id: application_2.id)

      expect(user.applications.first).to eq(application_1)
      expect(user.applications.last).to eq(application_2)
    end
  end
end
