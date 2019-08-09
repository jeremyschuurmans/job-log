require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  render_views

  describe "Log in page" do
    it "loads the log in page" do
      get :new
      expect(response.status).to eq(200)
      expect(response.body).to include("Log In")
    end
  end

  it "can create a new session" do
    user = User.create(name: "Grace Hopper",
                       email: "admiralgrace@googlemail.com",
                       password: "securepassword")

    post :create, params: { session: { email: "admiralgrace@googlemail.com", password: "securepassword" } }
    expect(session[:user_id]).to eq(user.id)
  end

  it "can delete a session" do
    user = User.create(name: "Grace Hopper",
                       email: "admiralgrace@googlemail.com",
                       password: "securepassword")

    post :create, params: { session: { email: "admiralgrace@googlemail.com", password: "securepassword" } }
    expect(session[:user_id]).to eq(user.id)

    delete :destroy, params: { session: { user_id: user.id } }
    expect(session[:user_id]).to eq(nil)
  end

  # it "can create a user via omniauth" do
  #   Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  #
  #   expect(session[:user_id]).to eq(nil)
  #   expect { post :create, params: { provider: :github } }.to change { User.count }.by(1)
  #   expect(session[:user_id]).not_to eq(nil)
  #   session[:user_id] = nil
  # end
  #
  # it "can create a session via omniauth" do
  #   user = User.create(name: "John Smith",
  #                      email: "john@googlemail.com",
  #                      password: "password")
  #
  #   Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  #
  #   expect(session[:user_id]).to eq(nil)
  #   post :create, params: { provider: :github }
  #   expect(session[:user_id]).not_to eq(nil)
  #   expect(session[:user_id]).to eq(user.id)
  #   user.destroy
  #   session[:user_id] = nil
  # end
end
