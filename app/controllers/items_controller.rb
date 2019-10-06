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
    @user = Item.where(user_id: @item.user_id).order("RAND()").limit(6)
    @category = Item.where(category_id: @item.category_id).order("RAND()").limit(6)
    @good = Good.new
  end
  
  def edit
    #あとで使います
    # @item = Item.find(params[:id])
  end


  def update
    #ログイン機能実装前なのでコメントアウトしてあります

    # if @item.user_id == current_user.id
      if items_params[:sizetype_id]
        @item.update(items_params)
      else
        @item.update(items_params.merge(sizetype_id: nil))
      end
      redirect_to action: :show
  end
  
  def destroy
    # if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
  end


  def exhibit
    @item = Item.new
    @item.build_delivery

    @item.images.build


  end

  def confirm
    #id仮置きです
    @user = User.find(1)
    @item = Item.find(1)
    @cards = Card.find(1)
  end

  def pay
    Payjp.api_key = 'sk_test_be508ed036c9c40e55488d6a'
    Payjp::Charge.create(
      amount: 1000, # 決済する値段
      card: params['payjp-token'],
      currency: 'jpy'
    )
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
