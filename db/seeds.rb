require 'faker'

50.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  password = Faker::Internet.password
  User.create!(name: name, email: email, password: password)
end

users = User.all

10.times do
  name = Faker::Company.name
  address = { :street_address => Faker::Address.street_address,
              :city => Faker::Address.city,
              :state => Faker::Address.state,
              :zipcode => Faker::Address.zip }
  telephone_number = Faker::PhoneNumber.phone_number
  contact_person = Faker::Name.name
  users.each {|user| user.companies.create!(name: name,
                                            address: address,
                                            telephone_number: telephone_number,
                                            contact_person: contact_person) }
end
