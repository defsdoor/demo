class SessionController < ApplicationController
  skip_before_action :must_be_signed_in

  def index
  end

  def new
    @user = User.new
  end

  def create
    if authenticate User.find_by_username params[:user][:username]
      redirect_to menu_path
    else
      redirect_to session_new_path, alert: t('.invalid_login')
    end
  end

  def destroy
    session.destroy
    redirect_to session_new_path
  end

  private

  def authenticate(user)
    if user && user.authenticate( params[:user][:password] )
      @current_user = user
      session[:current_user] = @current_user
      return @current_user
    else
      return false
    end
  end

  def user_params
  end
end
