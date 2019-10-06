class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
      @item.images.build
    render action: '/exhibit'
    end
  end
  
  def show
    # @item = Item.find(params[:id])
  end
  
  def edit
  end

  def update
    #ログイン機能実装前なのでコメントアウトしてあります

    # if @item.user_id == current_user.id
        @item.update!(items_params)
        redirect_to action: :show
      # else
      #   redirect_to action: :error 
      
    
  end

  def destroy
    # if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    # else
    #   redirect_to action: :error
    # end

  end

  def error
  end

  def exhibit
    @item = Item.new
    @item.build_delivery
    @item.images.build

  end

  def confirm
    @item = Item.find(7)
  end

  def pay
    @item = Item.find(7)
    Payjp.api_key = 'sk_test_be508ed036c9c40e55488d6a'
    charge = Payjp::Charge.create(
    :amount => @item.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
  end

  def category
    @categories = Category.where(ancestry: nil)
  end

  private
  def items_params
    params.require(:item).permit(:title, :explanation, :status_id, :price, :category_id, :brand_id, :sizetype_id, delivery_attributes:[:deliveryfee_id, :deliverysource_id, :deliverymethod_id, :deliverydate_id], images_attributes:[:image])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
