class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(params.require(:list).permit(:name))
    @list.user = @current_user

    if @list.save
      flash[:notice] = "You're a Busy Bee! You've just made a new list."
      redirect_to @list
    else
      redirect_to action: :new, notice: "Your list failed to save." 

      # <a onclick= \"textBoxFocus('name')\">Try again if you want.</a>".html_safe
    end
  end
  
  def destroy
  end

  
end
