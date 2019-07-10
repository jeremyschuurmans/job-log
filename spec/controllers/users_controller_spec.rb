require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  describe "Sign Up Page" do
    it 'loads the sign up page' do
      get :new
      expect(response.status).to eq(200)
      expect(response.body).to include("Sign Up")
    end

    it 'redirects user to companies#index' do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")

      expect(user).to_not be_a_new(User)
    end
  end
end
