class ReportsController < ApplicationController
  
  before_filter :require_admin
  
  def index
    @team_count = Team.count
    @public_count = Team.where(:company_type => 'Public Agency').count
    @busnp_count = Team.where(:company_type => 'Business/Non-Profit').count
    @bike_count = Team.where(:company_type => 'Bicycle-related Business').count
    @k12_count = Team.where(:company_type => 'K-12 School').count
    @college_count = Team.where(:company_type => 'College/University').count
    @user_count = User.count
    @newbies_count = User.where(:isnewbie => true).count
    @transpo_count = User.where(:bikerclass => 'Commuter/Transportation').count
    @rec_count = User.where(:bikerclass => 'Recreational').count
    @roadies_count = User.where(:bikerclass => 'Roadie').count
    @mtb_count = User.where(:bikerclass => 'MTB/Cross').count
    @bmx_count = User.where(:bikerclass => 'BMX').count
    @commute_count = Commute.count
    @bcc_commute_count = Commute.where(:commute_date => '2012-06-09'..'2012-06-15').count
    @bcc_sat_commute_count = Commute.where(:commute_date => '2012-06-09').count
    @bcc_sun_commute_count = Commute.where(:commute_date => '2012-06-10').count
    @bcc_mon_commute_count = Commute.where(:commute_date => '2012-06-11').count
    @bcc_tue_commute_count = Commute.where(:commute_date => '2012-06-12').count
    @bcc_wed_commute_count = Commute.where(:commute_date => '2012-06-13').count
    @bcc_thu_commute_count = Commute.where(:commute_date => '2012-06-14').count
    @bcc_fri_commute_count = Commute.where(:commute_date => '2012-06-15').count
    @bcc_fantastic_commute_count = Commute.where(:ridescore => 'Fan-freakin-tastic!').count
    @bcc_good_commute_count = Commute.where(:ridescore => 'Hella Good').count
    @bcc_meh_commute_count = Commute.where(:ridescore => 'Meh').count
    @bcc_hurtin_commute_count = Commute.where(:ridescore => "Hurtin'").count
    @bcc_abysmal_commute_count = Commute.where(:ridescore => 'Abysmal').count

    
  end
  
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
    @csv_options = { :force_quotes => true, :col_sep => ';' }
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
  
  def user_report
    # for csv_builder
    @output_encoding = 'UTF-8'
    @csv_options = { :force_quotes => true, :col_sep => ';' }
    # for csv_builder end
    
    respond_to do |format|
        format.html # user_report.html.erb
        # format.xml  { render :xml => @payments }
        format.csv do
            # timestamping your files is a nice idea if the user runs this action more than once...
            timestamp = Time.now.strftime('%Y-%m-%d_%H:%M:%S')
            # passing a meaningful filename is a nice touch
            @filename = "user_report_#{timestamp}.csv"
        end
    end
  end
  
end