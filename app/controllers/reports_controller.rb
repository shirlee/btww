class ReportsController < ApplicationController
  
  before_filter :require_admin
  
  def teams
    @teams = Team.all
    
  end
    
  def users
    @users = User.all
    
  end
  
  def team_report
    # for csv_builder
    # TODO - @teamname = param value pointing to  team name here
    # @filename = 'report.csv'
    @output_encoding = 'UTF-8'
    @csv_options = { :force_quotes => true, :col_sep => '/t' }
    # for csv_builder end
    
    respond_to do |format|
        format.html # team_report.html.erb
        # format.xml  { render :xml => @payments }
        format.csv do
            # timestamping your files is a nice idea if the user runs this action more than once...
            timestamp = Time.now.strftime('%Y-%m-%d_%H:%M:%S')
            # passing a meaningful filename is a nice touch
            @filename = "team_report_#{timestamp}.csv"
        end
    end
  end
  
  
end