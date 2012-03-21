class ApplicationController < ActionController::Base
  protect_from_forgery



  def logged_in?
    session[:user_id].present?
  end
  
  def require_login
    unless logged_in?
      flash[:error] = "Login or create an account to join the fun!"
      redirect_to new_session_url
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
