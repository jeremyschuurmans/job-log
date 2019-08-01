require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  describe "New (sign up page)" do
    it 'loads the sign up page' do
      get :new
      expect(response.status).to eq(200)
      expect(response.body).to include("Sign Up")
    end

    it 'instantiates a new user' do
      user = User.new

      expect(user).to be_a_new(User)
    end
  end

  describe "Create" do
    it 'persists a user into the database' do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")

      expect(user).to_not be_a_new(User)
      expect(user.id).to eq(1)
      expect(user.id).to_not eq(2)
    end
  end
end
