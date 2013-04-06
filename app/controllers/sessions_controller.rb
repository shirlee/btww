class SessionsController < ApplicationController
  def new
    @title = "Login | Bike Commuter Challenge"
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
        redirect_to root_url, :notice => "You are now signed in"
          if @user.email != User.find_by_email(data['info']['email'])
            @user.update_attributes(:email => data['info']['email'])
          end
          # if @user.2013_confirm != 'Y'
          #   @user.update_attributes(:email_confirm => 'Y')
          #     redirect_to root_url, :notice => "You are now signed in"
          # else
          #     completeprofile_url(@user.id), :notice => "You are back in the game for 2013! Now confirm your team and user info."
          # end
    elsif User.find_by_email(data['info']['email']) != nil
        @user = User.find_by_email(data['info']['email'])
        @user.update_attributes(:provider => data['provider'], :uid => data['uid'])
        session[:user_id] = @user.id
        # if @user.2013_confirm != 'Y'
        #   @user.update_attributes(:2013_confirm => 'Y')
        #     redirect_to root_url, :notice => "You are now signed in"
        # else
        #     completeprofile_url(@user.id), :notice => "You are back in the game for 2013! Now confirm your team and user info."
        # end
    else
      # redirect_to new_session_url, :notice => "Sorry - Your Facebook account is not associated with a user on this system, and new user registration is now closed."
      @user = User.new
      @pwd = rand(100000)
      @user.update_attributes(:provider => data['provider'], :uid => data['uid'],
                              :email => data['info']['email'], :fname => data['info']['first_name'], :lname => data['info']['last_name'],
                              :password => @pwd, :password_confirmation => @pwd,
                              :btww_email_list => true,
                              :general_email_list => true)
        
        if @user.save
            session[:user_id] = @user.id
            redirect_to completeprofile_url(@user.id), :notice => "New user created! Now add your team and complete your profile."
        else
            redirect_to root_url, :notice => "There was a problem"
        end
    end

  end

    
  def create
      user = User.find(:first, :conditions =>  ['UPPER(email) LIKE ?', "%#{params[:email].upcase}%"])
    # user = User.find_by_email(params[:email])
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
