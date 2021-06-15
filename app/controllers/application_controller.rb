class ApplicationController < ActionController::Base
  before_action :must_be_signed_in

  def current_user
    Rails.logger.error "session is #{session.inspect}"
    @current_user ||= session[:current_user]
  end

  private

  def authenticate(user)
    if user && user.authenticate( params[:user][:password] )
      @current_user = user
      Rails.logger.error "Current user is #{@current_user}"
      session[:current_user] = @current_user
      return @current_user
    else
      return false
    end
  end

  def must_be_signed_in
    redirect_to session_new_path, alert: t('must_be_signed_in') unless current_user
  end
end
