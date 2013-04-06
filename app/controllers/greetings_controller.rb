class GreetingsController < ApplicationController
  def index
  end
  
  def contest_ended
  end

  def confirm
    @email=params[:email]
  end

end
