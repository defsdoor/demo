class ApplicationController < ActionController::Base
  before_action :must_be_signed_in

  def current_user
    Rails.logger.error "session is #{session.inspect}"
    @current_user ||= session[:current_user]
  end

  private

  def must_be_signed_in
    redirect_to session_new_path, alert: t('must_be_signed_in') unless current_user
  end
end
