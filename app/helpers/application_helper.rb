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
  
 
  def is_the_team_leader?
        logger.debug "is_the_team_leader? is running"
    if @user != nil
      if @user.team != nil
        if logged_in? && User.find(@user.team.leader) == get_user
          return true
        end
      end 
    elsif @team != nil
      if logged_in? && @team.leader == get_user.id
        return true
        logger.debug "the team leader id for this team is #{@team.leader}, and the logged in user's id is #{get_user.id}"
      end
    else
      return false
    end
  end
  
  
  def num_competing_teams(award)
    Team.where(:company_type => award.company_type,
  					   :company_size_range => award.company_size_range)
  			.count
  end
  
  
end
