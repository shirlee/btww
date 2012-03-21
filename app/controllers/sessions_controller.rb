class SessionsController < ApplicationController
  def new
  end

  def fb_auth
    data = request.env['omniauth.auth']
    logger.debug data.inspect
    logger.debug "Provider: #{data['provider']}"
    logger.debug "UID: #{data['uid']}"
    logger.debug "Email Address: #{data['info']['email']}"
    logger.debug "First Name: #{data['info']['first_name']}"
    logger.debug "Last Name: #{data['info']['last_name']}"
    if User.find_by_uid(data['uid']) != nil
        @user = User.find_by_uid(data['uid'])
        session[:user_id] = @user.id
          if @user.email != User.find_by_email(data['info']['email'])
            @user.update_attributes(:email => data['info']['email'])
          end
        redirect_to root_url, :notice => "You are now signed in"
    elsif User.find_by_email(data['info']['email']) != nil
        @user = User.find_by_email(data['info']['email'])
        @user.update_attributes(:provider => data['provider'], :uid => data['uid'])
        session[:user_id] = @user.id
        redirect_to root_url, :notice => "You are now signed in"
    else
      @user = User.new
      @pwd = rand(100000)
      @user.update_attributes(:provider => data['provider'], :uid => data['uid'],
                              :email => data['info']['email'], :fname => data['info']['first_name'], :lname => data['info']['last_name'],
                              :password => @pwd, :password_confirmation => @pwd)
        if @user.save
            session[:user_id] = @user.id
            redirect_to edit_user_url(@user.id), :notice => "New user created! Please add a team and complete the profile."
        else
            redirect_to root_url, :notice => "There was a problem"
        end
    end

  end

    
  def create
    user = User.find_by_email(params[:email])
      if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "You are now signed in"
    else
      redirect_to new_session_url, :notice => "Incorrect Email or Password"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'You are now signed out.'
  end

end
