class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :current_admin
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session.record
	rescue
		return nil
  end
  
  def current_admin
    return @current_admin if defined?(@current_admin)
    @current_admin = current_user_session.record.admin
	rescue
		return false
  end
  
end
