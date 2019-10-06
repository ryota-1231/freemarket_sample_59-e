class ItemsController < ApplicationController

  def index
    @items = Item.all.limit(10)
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
    @category = Category.new
    @item.build_delivery
    @item.build_category

  end

  def confirm
    @user = User.find(1)
    @item = Item.find(1)
    @cards = Card.find(1)
  end

  def pay
    # @item = Item.find(7)
    Payjp.api_key = 'sk_test_be508ed036c9c40e55488d6a'
    Payjp::Charge.create(
      amount: 1000, # 決済する値段
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

  private
  def items_params
    params.require(:item).permit(:title, :explanation, :status, :price, :category_id,delivery_attributes:[:delivery_fee,:delivery_source,:delivery_method,:delivery_date])

  end

end
