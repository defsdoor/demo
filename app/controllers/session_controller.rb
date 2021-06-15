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

  private

  def user_params
  end
end
