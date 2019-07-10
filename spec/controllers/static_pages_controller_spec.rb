require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views

  describe "Homepage" do
    it 'loads the homepage' do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include("Welcome to JobLog")
    end

    it 'contains a sign up link' do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include("Sign Up")
    end

    it 'contains a log in link' do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include("Log In")
    end
  end

  describe "Sign up page" do
    it 'loads the sign up page' do
      get :signup
      expect(response.status).to eq(200)
      expect(response.body).to include("Sign Up")
    end

    # it 'redirects user to companies#index' do
    #   user = User.create(name: "Grace Hopper",
    #                      email: "admiralgrace@googlemail.com",
    #                      password: "securepassword")
    #
    #   expect(user).to be_a_new(User)
    # end
  end

  describe "Log in page" do
    it 'loads the log in page' do
      get :login
      expect(response.status).to eq(200)
      expect(response.body).to include("Log In")
    end
  end
end
