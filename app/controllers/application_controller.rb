class ApplicationController < ActionController::Base
  protect_from_forgery

  def find_user
    @user = User.find(params[:id])
  end

  def logged_in?
    session[:user_id].present?
  end
  
  def get_user
    if logged_in?
      User.find_by_id(session[:user_id])
    else
      
    end
  end
  
  def is_the_user?
    if logged_in? && @user.id == get_user.id
      # if logged_in? && @user.id == get_user.id
        return true
    elsif isadmin?
        return true
    else
        return false
    end
  end
  
  def require_istheuser
    unless is_the_user?
      flash[:error] = "You do not have permissions"
      redirect_to root_url
    end
  end
  
  
  def isadmin?
    if logged_in?
      get_user.isadmin
    end
  end
  
  def require_login
    unless logged_in?
      flash[:error] = "Login or create an account to join the fun!"
      redirect_to new_session_url
    end
  end
  
  def require_admin
    unless isadmin?
      flash[:error] = "You are not allowed that function!"
      redirect_to root_url
    end
  end
  
  
  def is_the_team_leader?
    if @user != nil
      if logged_in? && @user.team.id == get_user.team_id
        get_user.isleader
      end
    elsif @team!= nil
      if logged_in? && @team.id == get_user.team_id
        get_user.isleader
      end
    else
    end
  end 
  
  def require_leader
    unless is_the_team_leader? || isadmin?
      flash[:error] = "Only your team leader or an admin can do that"
      redirect_to root_url
    end
  end
  
  def update_team_stats(team)
    team.update_attributes(:mileage => team.mileage_calc,
                            :total_commutes => team.total_commutes_calc,
                            :commuters => team.commuters_calc,
                            :zero_commutes => team.zero_commutes_calc,
                            :team_participation => team.team_participation_calc,
                            :newbies => team.newbies_calc
                            )
  end
  
end
