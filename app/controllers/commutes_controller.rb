class CommutesController < ApplicationController
  # GET /commutes
  # GET /commutes.json

  before_filter :require_login, :except => [:index, :show]

  def index
    if params[:user_id]
      @commutes = Commute.find_all_by_user_id(params[:user_id])
      @user = User.find(params[:user_id])

    else
      @commutes = Commute.order('commute_date desc')
    
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @commutes }
    end
  end


  # GET /commutes/1
  # GET /commutes/1.json
  def show
    @commute = Commute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @commute }
    end
  end

  # GET /commutes/new
  # GET /commutes/new.json
  def new
    @commute = Commute.new
    @commute.user = User.find_by_id(get_user.id)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @commute }
    end
  end

  # GET /commutes/1/edit
  def edit
    @commute = Commute.find(params[:id])
  end

  # POST /commutes
  # POST /commutes.json
  def create
    @commute = Commute.new(params[:commute])

    respond_to do |format|
      if @commute.save
          if update_team_stats(@commute.user.team)
          format.html { redirect_to @commute, notice: 'Commute was successfully created.' }
          format.json { render json: @commute, status: :created, location: @commute }
        else
          format.html { redirect_to @commute, notice: 'Commute was successfully updated, but Team Stats were not updated because the Team does not have all the required information. A leader might be missing.' }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @commute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /commutes/1
  # PUT /commutes/1.json
  def update
    @commute = Commute.find(params[:id])

    respond_to do |format|
      if @commute.update_attributes(params[:commute])
          if update_team_stats(@commute.user.team)
            format.html { redirect_to @commute, notice: 'Commute was successfully updated.' }
            format.json { head :ok }
          else
            format.html { redirect_to @commute, notice: 'Commute was successfully updated, but Team Stats were not updated because the Team does not have all the required information. A leader might be missing.' }
          end
      else
        format.html { render action: "edit" }
        format.json { render json: @commute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commutes/1
  # DELETE /commutes/1.json
  def destroy
    @commute = Commute.find(params[:id])
    @commute.destroy
    update_team_stats(@commute.user.team)

    respond_to do |format|
      format.html { redirect_to user_url(@commute.user) }
      format.json { head :ok }
    end
  end
  

  
  
end
