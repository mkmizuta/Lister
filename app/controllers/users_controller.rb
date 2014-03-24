class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save
      flash[:notice] = "You signed up successfully."
      session[:user_id] = @user.id
      redirect_to action: :show
    else
      render action: :new
    end
  end

  def show
    @lists = List.all
  end
end
