class ItemsController < ApplicationController

  def index
    @items = Item.new
  end
  
  def new
  end

  def create
    @items = Item.create(items_params)
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
    @items = Item.new


  end

  def confirm
  end

  private
  def items_params

  end

end
