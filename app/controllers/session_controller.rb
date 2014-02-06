class SessionController < ApplicationController

  def new
    if !@current_user.nil?
      redirect_to root_path
    else
      render :new
    end
  end

  def create
    @user = User.find_by(username: params[:username]) 
    if @user && User.authenticate(params[:username], params[:password]) 
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully signed in."   
    else
      flash[:notice] = "Invalid username or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You've successfully signed out."
  end  
end 