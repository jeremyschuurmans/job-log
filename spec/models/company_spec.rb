require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: "Grace Hopper",
                       email: "admiralgrace@googlemail.com",
                       password: "securepassword")

    company = Company.create(name: "Pied Piper",
                             address: { :street_address =>  "12341234 Recursion Way",
                                        :city => "Portland",
                                        :state => "Oregon",
                                        :zip_code => 97224 },
                             telephone_number: 555-555-5555,
                             contact_person: "Nelson Bighetti")

    expect(company).to be_valid
  end

  it 'is invalid without a name' do
    user = User.create(name: "Grace Hopper",
                       email: "admiralgrace@googlemail.com",
                       password: "securepassword")

    company = Company.create(name: "",
                             address: { :street_address =>  "12341234 Recursion Way",
                                        :city => "Portland",
                                        :state => "Oregon",
                                        :zip_code => 97224 },
                             telephone_number: 555-555-5555,
                             contact_person: "Nelson Bighetti")

    expect(company).to be_invalid
  end

  it 'is invalid without an address' do
    user = User.create(name: "Grace Hopper",
                       email: "admiralgrace@googlemail.com",
                       password: "securepassword")

    company = Company.create(name: "Pied Piper",
                             address: {},
                             telephone_number: 555-555-5555,
                             contact_person: "Nelson Bighetti")

    expect(company).to be_invalid
  end

  it 'is invalid without a telephone number' do
    user = User.create(name: "Grace Hopper",
                       email: "admiralgrace@googlemail.com",
                       password: "securepassword")

    company = Company.create(name: "Pied Piper",
                             address: { :street_address =>  "12341234 Recursion Way",
                                        :city => "Portland",
                                        :state => "Oregon",
                                        :zip_code => 97224 },
                             telephone_number: "",
                             contact_person: "Nelson Bighetti")

     expect(company).to be_invalid
   end

  it 'is invalid without a contact person' do
    user = User.create(name: "Grace Hopper",
                       email: "admiralgrace@googlemail.com",
                       password: "securepassword")

    company = Company.create(name: "Pied Piper",
                             address: { :street_address =>  "12341234 Recursion Way",
                                        :city => "Portland",
                                        :state => "Oregon",
                                        :zip_code => 97224 },
                             telephone_number: 555-555-5555,
                             contact_person: "")

     expect(company).to be_invalid
  end
end
