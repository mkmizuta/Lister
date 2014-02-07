class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @list_item = ListItem.new
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
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

 
  
  def update
   respond_to do 
      if @list.update(list_params)
        redirect_to @list, notice: 'List was successfully updated.' 
      else
        render action: 'edit' 
      end
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_url
  end
end
