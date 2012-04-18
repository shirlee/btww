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
    if @user != nil
      if @user.team != nil
        if logged_in? && User.find(@user.team.leader) == get_user
          return true
        end
      end 
    elsif @team != nil
      if logged_in? && @team.leader == get_user.id
        return true
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
  
  def users_scoreboard(user)
    if user.team != nil && user.team.company_size_range != nil
      a = Award.where(:company_size_range => user.team.company_size_range,
                       :company_type => user.team.company_type,
                       :goal => 'Participation Rate')
                .first
      return a
    end
  end

  
  def after_btww_start?
    if Date.today.to_s > "2012-06-09"
      return true
    else
      return false
    end
  end
  
end
