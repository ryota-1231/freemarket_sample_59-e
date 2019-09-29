class ItemsController < ApplicationController

  def index
    @items = Item.all
  end
  
  def new
  end

  def create
  end
  
  def show
    # @item = Item.find(params[:id])
  end
  
  def edit
  end

  def update
  end
  
  def destroy
  end  

  def exhibit
  end

  def confirm
  end

end
