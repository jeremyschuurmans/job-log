class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth
      login_or_create_user_via_omniauth
    else
      @user = User.find_by(email: params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        log_in @user
        redirect_back_or companies_url
      else
        flash[:alert] = "Username or password is invalid."
        redirect_to login_url
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

    def auth
      Rails.application.env_config['omniauth.auth']
    end

    def login_or_create_user_via_omniauth
      @user = User.find_by(email: auth['info']['email'])
      if @user
        log_in @user
        redirect_to companies_url
      else
        password = SecureRandom.urlsafe_base64
        @user = User.create(name: auth['info']['name'], email: auth['info']['email'], password: password)
        log_in @user
        redirect_to companies_url
      end
    end
end
