class ListsController < ApplicationController

  def index
    if @current_user 
      @others_lists = List.all - @current_user.lists 
      @my_lists = @current_user.lists
    else
      @others_lists = List.all
      @my_list = nil
    end
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
      flash[:notice] = "Your list failed to save." 
      render action: :new
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
