class ApplicationController < ActionController::Base
  protect_from_forgery

  def loggedin
    if session[:user_id]
      true
    else
      redirect_to root_url, :notice => 'You need to sign in first'
      false
    end
  end
  
end
