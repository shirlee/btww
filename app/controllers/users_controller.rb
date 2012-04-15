class UsersController < ApplicationController
  # GET /users
  # GET /users.json

  before_filter :find_user, :except =>  [:index, :new, :create]
  before_filter :require_istheuser, :except =>  [:index, :show, :new, :create]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if @user.team_id != nil
      @award = Award.where(:company_type => @user.team.company_type,
                           :company_size_range => @user.team.company_size_range,
                           :goal => 'Participation Rate')
      logger.debug "Award is #{@award}"
      logger.debug "Award ID is #{@award[0].id}"
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @user.team_id = params[:team_id]
    @user.btww_email_list = true
    @user.general_email_list = true
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    if @user.team == nil
      render 'chooseteam'
    end
    if params[:team_id] != nil
      @user.team_id = params[:team_id]
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save

        if @user.team != nil
          update_team_stats(@user.team)
        else
        end

        if logged_in? == false
          session[:user_id] = @user.id
        else
        end
        
        if @user.team != nil
        format.html { redirect_to team_url(@user.team.id), notice: "You're in! Let's get started!" }
        format.json { render json: @user, status: :created, location: @user }
        else
        format.html { redirect_to chooseteam_url(@user.id) }
        end
      
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end


  # PUT /users/1
  # PUT /users/1.json
  def update
    old_team = @user.team
    
    respond_to do |format|
      
      if @user.update_attributes(params[:user])
        if old_team != nil
          update_team_stats(old_team)
        end
        if @user.team != nil
          update_team_stats(@user.team)
        end
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    team = @user.team_id
    @user.destroy
      if team != nil
        update_team_stats(team)
      end
      
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
