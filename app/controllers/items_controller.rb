class ItemsController < ApplicationController

  def index
    @items = Item.all
  end
  
  def new
  end

  def create
    @item = Item.new(items_params)
  
  

    if @item.save
      redirect_to root_path
    else
      render 'items/exhibit'
    end
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
    @item = Item.new
    @item.build_delivery
    @item.build_category

  end

  def confirm
  end

  private
  def items_params
    params.require(:item).permit(:title, :explanation, :status, :price, :category_id, :brand_id, delivery_attributes:[:delivery_fee,:delivery_source,:delivery_method,:delivery_date])

  end

end
