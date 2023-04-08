class ApplicationController < ActionController::Base

  def session_id
    session[:session_id]
  end
  helper_method :session_id
end
