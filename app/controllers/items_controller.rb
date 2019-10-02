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
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    # if item.user_id == current_user.id
      item.update(items_params)
      redirect_to action: :show
    end
  # end
  
  def destroy
  end  

  def exhibit
    @item = Item.new
    @category = Category.new
    @item.build_delivery
    @item.build_category

  end

  def confirm
  end

  private
  def items_params
    params.require(:item).permit(:title, :explanation, :status, :price, :category_id,delivery_attributes:[:deliveryfee_id,:deliverysource_id,:deliverymethod_id,:deliverydate_id])

  end

end
