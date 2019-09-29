class ItemsController < ApplicationController

  def index
  end
  
  def new
  end

  def create
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    # @item = Item.find(params[:id])
  end

  def update
    # item = Item.find(params[:id])
    # if item.buyer_id == current_user.id
    #   items.update()
    #   render 
    # end
  end
  
  def destroy
  end  

  def exhibit
  end

  def confirm
  end

end
