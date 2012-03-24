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

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit

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
        format.html { redirect_to edit_user_url(@user.id), notice: "Choose a Team, or add a New Team" }
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

    respond_to do |format|
      if @user.update_attributes(params[:user])
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
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
