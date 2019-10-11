class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.limit(10)
    @categories = Category.where(ancestry: nil)
    @items_for_woman = Item.where(category_id: 3..199).limit(10)
    @items_for_man = Item.where(category_id: 202..343).limit(10)
    @items_for_mecha = Item.where(category_id: 895..978).limit(10)
    @items_for_hobby = Item.where(category_id: 682..792).limit(10)
    @items_for_chanel = Item.where(brand_id: 8385).limit(10)
    @items_for_viton = Item.where(brand_id: 764)
    @items_for_supreme = Item.where(brand_id: 8412)
    @items_for_nike = Item.where(brand_id: 3812)

  end

  def new
    @user = current_user.id
  end

  def create
    @item = Item.new(items_params)


    @item.user_id = current_user.id


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
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end
  
  def edit
    #あとで使います
    # @item = Item.find(params[:id])
  end

  def update
    if @item.user_id == current_user.id
      if items_params[:sizetype_id]
        @item.update(items_params)
      else
        @item.update(items_params.merge(sizetype_id: nil))
      end
      redirect_to action: :show
    end
  end
  
  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end

  def exhibit
    @item = Item.new
    @item.build_delivery
    @item.images.build
    
  end

  def confirm
    #id仮置きです
    @item = Item.find(2)
    @user = @item.user
    @cards = Card.find(1)
    @buyer = current_user

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

  # def pay
  #   @item = Item.find(7)
  #   Payjp.api_key = 'sk_test_be508ed036c9c40e55488d6a'
  #   charge = Payjp::Charge.create(
  #   :amount => @item.price,
  #   :card => params['payjp-token'],
  #   :currency => 'jpy',
  #   )
  # end

  def search_index
    @q = Item.ransack(params[:q])
    @category = Category.where(ancestry:nil)
    @brands = Brand.all
    @sizetype = Sizetype.where(ancestry:nil)
    @status = Status.all
    @delivery = Delivery.all
    @items = @q.result(distinct: true)
  end

  def search
    @q = Item.search(search_params)
    @items = @q.result(distinct: true)
  end

  private
  def items_params
    params.require(:item).permit(:title, :explanation, :status_id, :price, :category_id, :brand_id, :sizetype_id, delivery_attributes:[:deliveryfee_id, :deliverysource_id, :deliverymethod_id, :deliverydate_id], images_attributes:[:image])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_params
    params.require(:q).permit( {:category_id_in => []})
  end

end
