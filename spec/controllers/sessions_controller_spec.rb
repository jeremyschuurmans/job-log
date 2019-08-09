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
end
