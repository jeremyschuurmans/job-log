require 'rails_helper'

RSpec.describe User, :type => :model do
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

end
