class SessionController < ApplicationController

  def new
  end

  def create
    @current_user = User.find_by(username: params[:username]) 
    if @current_user && User.authenticate(params[:username], params[:password]) 
      session[:user_id] = @current_user.id
      redirect_to root_path, notice: "Successfully signed in."   
    else
      flash[:notice] = "Invalid username or password."
      render :new
    end
  end
end 