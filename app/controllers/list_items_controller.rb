class ListItemsController < ApplicationController

 def create
    @list_item = ListItem.new(params.require(:list_item).permit(:to_do)) 
    @list = List.find(params[:list_item][:list_id])
    @list_item.list = @list
    
    respond_to do |format|
      if @list_item.save
        format.html { 
          redirect_to @list, notice: "Your list has grown."
        }
        format.js
      else
        format.html{
          render action: :show, notice: "Your to do item failed to save."
        }
      end
    end      
  end 


  def destroy
    @list_items = ListItem.find(params[:id])
    @list = @list_items.list
    respond_to do |format|
      @list_items.destroy
      format.html {
        redirect_to @list
      }
      format.js
    end
  end
end