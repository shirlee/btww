class AwardsController < ApplicationController
  # GET /awards
  # GET /awards.json

  before_filter :require_admin, :except =>  [:index, :show]

  def index
    @awards = Award.find_all_by_goal('Participation Rate')
    @title = "Scoreboards | Bike Commuter Challenge"
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @awards }
    end
  end

  # GET /awards/1
  # GET /awards/1.json
  def show
    @award = Award.find(params[:id])
    @title = "Team Standings for #{@award.company_type} & #{@award.company_size_range} Employees | Bike Commuter Challenge"    

    if @award.isindividual == nil || @award.isindividual == false

      if @award.goal == 'Participation Rate'
           goal = 'team_participation desc'
        elsif @award.goal == 'Total Mileage'
           goal = 'mileage desc'
        elsif @award.goal == 'Number of Newbies'
           goal = 'newbies desc'
        elsif @award.goal == 'Number of Commutes'
           goal = 'total_commutes desc'
        elsif @award.goal == 'Total Commuters'
           goal = 'total_commuters desc'
        else goal = 'company asc'
      end

      @teams = Team.where(:company_type => @award.company_type,
                          :company_size_range => @award.company_size_range,)
                    .order("#{goal}")
            
      @award_list = Award.where(:company_type => @award.company_type,
                                  :company_size_range => @award.company_size_range)
 
    else

     commuters = User.joins(:commutes).select("distinct(users.id)")
        @users = Array.new
        commuters.each do |commuter|
          @users << User.find_by_id(commuter)
        end
      
     @award_list = Award.where(:isindividual => true)
    
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @award }
    end
  end

  # GET /awards/new
  # GET /awards/new.json
  def new
    @award = Award.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @award }
    end
  end

  # GET /awards/1/edit
  def edit
    @award = Award.find(params[:id])
  end

  # POST /awards
  # POST /awards.json
  def create
    @award = Award.new(params[:award])

    respond_to do |format|
      if @award.save
        format.html { redirect_to @award, notice: 'Award was successfully created.' }
        format.json { render json: @award, status: :created, location: @award }
      else
        format.html { render action: "new" }
        format.json { render json: @award.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /awards/1
  # PUT /awards/1.json
  def update
    @award = Award.find(params[:id])

    respond_to do |format|
      if @award.update_attributes(params[:award])
        format.html { redirect_to @award, notice: 'Award was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @award.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /awards/1
  # DELETE /awards/1.json
  def destroy
    @award = Award.find(params[:id])
    @award.destroy

    respond_to do |format|
      format.html { redirect_to awards_url }
      format.json { head :ok }
    end
  end
end
