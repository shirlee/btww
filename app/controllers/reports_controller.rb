class ReportsController < ApplicationController
  
  before_filter :require_admin
  
  def teams
    @teams = Team.all
    
  end
    
  def users
    @users = User.all
    
  end
  
  
end