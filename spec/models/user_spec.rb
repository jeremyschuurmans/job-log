require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'validations' do
    it 'is valid if it has valid attributes' do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")

      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.create(name: "",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")

      expect(user).to be_invalid
    end

    it 'is invalid without an email' do
      user = User.create(name: "Grace Hopper",
                         email: "",
                         password: "secure_password")

      expect(user).to be_invalid
    end

    it 'is invalid without a password' do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "")

      expect(user).to be_invalid
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
    it 'has many applications' do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "password")

      company_1 = Company.create(name: "Codeco",
                                 address: "123 Avenue St",
                                 telephone_number: "503-555-5555",
                                 contact_person: "Steve Jobs")

      company_2 = Company.create(name: "Braeburn",
                                 address: "123 Apple St",
                                 telephone_number: "503-555-5555",
                                 contact_person: "Steve Gates")

      user.companies << [company_1, company_2]

      application_1 = Application.find_by(id: company_1.id)
      application_1.update(company_name: "Codeco", date: 06/29/2019, followup: false)

      application_2 = Application.find_by(id: company_2.id)
      application_2.update(company_name: "Braeburn", date: 06/29/2019, followup: false)

      expect(user.applications.first).to eq(application_1)
      expect(user.applications.last).to eq(application_2)
    end

    it 'has many companies through applications' do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "password")

      company_1 = Company.create(name: "Codeco",
                                 address: "123 Avenue St",
                                 telephone_number: "503-555-5555",
                                 contact_person: "Steve Jobs")

      company_2 = Company.create(name: "Braeburn",
                                 address: "123 Apple St",
                                 telephone_number: "503-555-5555",
                                 contact_person: "Steve Gates")

      user.companies << [company_1, company_2]

      expect(user.companies.first).to eq(company_1)
      expect(user.companies.last).to eq(company_2)
      expect(user.applications.first.user_id).to eq(user.id)
      expect(user.applications.last.user_id).to eq(user.id)
      expect(user.applications.first.company_id).to eq(company_1.id)
      expect(user.applications.last.company_id).to eq(company_2.id)
    end
  end
end
