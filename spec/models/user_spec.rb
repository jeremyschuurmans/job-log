require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'is valid if it has valid attributes' do
    user = User.create(name: "Grace Hopper",
                       email: "admiralgrace@googlemail.com",
                       password_digest: "securepassword")

    expect(user).to be_valid
  end


  it 'is invalid without a name'
  it 'is invalid without an email'
  it 'is invalid without a password'

end
