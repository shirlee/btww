class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :ensure_domain

  APP_DOMAIN = 'www.bike2workweek.com'

  def ensure_domain
    if request.env['HTTP_HOST'] != APP_DOMAIN && request.env['HTTP_HOST'] != 'localhost:3000'
      # HTTP 301 is a "permanent" redirect
       redirect_to "http://#{APP_DOMAIN}#{request.env['REQUEST_PATH']}", :status => 301
    end
  end

  def find_user
    @user = User.find(params[:id])
    # logger.debug "find_user: This page is about User #{@user}"
  end

  def logged_in?
    session[:user_id].present?
  end

# returns currently logged in User  
  def get_user
    if logged_in?
      return User.find_by_id(session[:user_id])
    # logger.debug "get_user ran. Logged in User #{User.find_by_id(session[:user_id])}"
    else
      
    end
  end
  
  def is_the_user?
    # logger.debug "is_the_user: This page is about User #{@user.fname}"
    # logger.debug "is_the_user: Logged in User #{get_user}"
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
      redirect_to root_url, :notice => "You do not have permissions"
    end
  end
  
  
  def isadmin?
    if logged_in?
      get_user.isadmin
    end
  end
  
  def require_login
    unless logged_in?
      redirect_to new_session_url, :notice => "Login or create an account to join the fun!"
    end
  end
  
  def require_team
    if logged_in?
      unless get_user.team_id != nil
        redirect_to edit_user_url(get_user.id), :notice => "Choose a team before you can log a commmute!"
      end
    end
  end  
  
  def require_admin
    unless isadmin?
      redirect_to root_url, :notice => "You are not allowed that function!"
    end
  end
  
  
  def is_the_team_leader?
        logger.debug "is_the_team_leader? is running"
    if @user != nil
      if logged_in? && User.find(@user.team.leader) == get_user
        return true
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
  
  def require_leader
    unless is_the_team_leader? || isadmin?
      redirect_to root_url, :notice => "Only your team leader or an admin can do that"
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
