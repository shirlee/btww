class TeamsController < ApplicationController
  # GET /teams
  # GET /teams.json

  before_filter :require_login, :except => [:index, :show]
  before_filter :the_team, :except => [:index, :new, :create]
  before_filter :require_leader, :except => [:index, :show, :new, :create]

  def the_team
     @team = Team.find(params[:id])
  end


  def index
    @teams = Team.search(params[:search])
  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])
    @team_leader = User.find(@team.leader)
    @award_list = Award.where(:company_type => @team.company_type,
                                :company_size_range => @team.company_size_range)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
    logger.debug "These are the leaders of the curret Team: #{@leaders}"
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(params[:team])
    @team.company_size_range = company_size_range
    @team.leader = get_user.id
                              
    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])
                              
    respond_to do |format|
      if @team.update_attributes(params[:team]) && @team.update_attributes(:company_size_range => company_size_range) && update_team_stats(@team)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
      @team.users.each do |user|
        user.update_attributes(:team_id => nil)
      end
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      # format.json { head :ok }
    end
  end
  
  def company_size_range
    company_size_range = case @team.size
      when 5..24 then '5-24'
      when 25..99 then '25-99'
      when 100..499 then '100-499'
      else '500+'
    end
    return company_size_range
  end
  


  
end


