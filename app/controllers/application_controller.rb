class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :current_user

  def current_user
    @user = User.find_by_email('trial.user@easysite.com')
  end

  def site
    @site = Site.find(params[:site_id])
  end
end
