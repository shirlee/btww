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
  
    
  def isadmin?
    if logged_in?
      get_user.isadmin
    end
  end
  
  def teamleader?
    if logged_in?
      get_user.isleader
    end
  end
 
  def is_the_team_leader?
    if logged_in? && @user.team.id == get_user.team_id
      get_user.isleader
    end
  end 
    
end
