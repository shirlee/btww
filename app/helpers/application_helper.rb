module ApplicationHelper
  
  def logged_in?
    session[:user_id].present?
  end
  
  
  def get_user
    if logged_in?
      User.find_by_id(session[:user_id])
    else
      
    end
  end
    
  
  def teamleader?
    if logged_in?
      get_user.isleader
    end
  end
  
    
end
