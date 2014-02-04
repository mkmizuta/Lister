class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save!
      redirect_to action: 'new'
    else
      render action 'new'
    end
  end

  def show
    
  end
end


  # POST 'create'
  #   with valid attributes
  #     is a redirect (FAILED - 9)
  #     changes user count by 1 (FAILED - 10)
  #     sets a flash message (FAILED - 11)
  #   with invalid attributes
  #     renders the new template (FAILED - 12)
  #     does not create a user (FAILED - 13)
  # GET 'show'
  #   is successful (FAILED - 14)

