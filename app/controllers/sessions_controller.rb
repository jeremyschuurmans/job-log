class SessionsController < ApplicationController
  layout "form_page"

  def new
    @user = User.new
  end

  def create
    if auth
      @user = User.find_by(email: auth['info']['email'])
      if @user
        log_in @user
        redirect_to companies_url
      else
        password = SecureRandom.urlsafe_base64
        @user = User.create(name: auth['info']['name'], email: auth['info']['email'], password: password)
        log_in @user
        flash[:success] = "Success!"
        redirect_to companies_url
      end
    else
      @user = User.find_by(email: params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        log_in @user
        redirect_back_or companies_url
      else
        flash[:danger] = "Username or password is invalid."
        redirect_to login_url
      end
    end
  end

  def destroy
    log_out if logged_in?
    flash[:alert] = "Have a nice day!"
    redirect_to root_url
  end

  private

    def auth
      Rails.application.env_config['omniauth.auth']
    end

end
