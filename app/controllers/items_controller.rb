class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :header_category
  
  

  def index
    @items = Item.all.limit(10).includes(:images)
    @categories = Category.where(ancestry: nil).includes(:images)
    @items_for_woman = Item.where(category_id: 3..199).order('id ASC').includes(:images).limit(10)
    @items_for_man = Item.where(category_id: 202..343).order('id ASC').includes(:images).limit(10)
    @items_for_mecha = Item.where(category_id: 895..978).order('id ASC').includes(:images).limit(10)
    @items_for_hobby = Item.where(category_id: 682..792).order('id ASC').includes(:images).limit(10)
    @items_for_chanel = Item.where(brand_id: 2466).order('id ASC').includes(:images).limit(10)
    @items_for_viton = Item.where(brand_id: 6220).order('id ASC').includes(:images).limit(10)
    @items_for_supreme = Item.where(brand_id: 8509).order('id ASC').includes(:images).limit(10)
    @items_for_nike = Item.where(brand_id: 3848).order('id ASC').includes(:images).limit(10)
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
    @image = Image.new
    @parents = Category.where(ancestry: nil )
    @parent =  @item.category.root
    @children = @parent.children
    @child = @item.category.parent
    @g_child = @child.children
  

  end

  def update
    
    if @item.user_id == current_user.id
      if params[:item][:sizetype_id]
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

  def pay

    @item = Item.find(params[:id])
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = 'sk_test_be508ed036c9c40e55488d6a'
    if @card.present?
      Payjp::Charge.create(
        amount: @item.price, 
        card: params['payjp-token'],
        customer: @card.buyer_id, 
        currency: 'jpy'
      )
    else
      Payjp::Charge.create(
        amount: @item.price,
        card: params['payjp-token'],
        currency: 'jpy'
      )
    end
  
      
    @item = Item.find(params[:id])
    @item.purchase = 1
    Sold.create(user_id: @item.user_id,item_id: @item.id)
    @item.save
    redirect_to "/items/buied/#{params[:id]}"
  end

  def buied 
    @item = Item.find(params[:id])
    @item.purchase = 1
    @item.save
  end  


  def search_index
    if params[:q].present?
      @search = Item.ransack(params[:q])
      @category = Category.where(ancestry: nil)
      @brands = Brand.all
      @sizetype = Sizetype.where(ancestry: nil)
      @status = Status.all
      @delivery = Delivery.all
      @items = @search.result(distinct: true)
    else
      @category = Category.where(ancestry: nil)
      @brands = Brand.all
      @sizetype = Sizetype.where(ancestry: nil)
      @status = Status.all
      @delivery = Delivery.all
      @items = @search.result(distinct: true)
      params[:q] = { sorts: 'id desc' }
      @search = Item.ransack
      @items = Item.all
    end
  end

  def search
    if params[:q][:delivery_id_in].present?
      links = []
      params[:q][:delivery_id_in].each do |fee|
        if fee.present?
          @fee = Delivery.where(deliveryfee_id: fee)
          @fee.each do |f|
            links << f.id
          end
        end
      end
      params[:q][:delivery_id_in] = []
      links.each do |link|
        params[:q][:delivery_id_in] << link if link.present?
      end
    end
    @category = Category.where(ancestry:nil)
    @brands = Brand.all
    @sizetype = Sizetype.where(ancestry:nil)
    @status = Status.all
    @delivery = Delivery.all
    @search = Item.ransack(search_params)
    @items = @search.result(distinct: true)
  end

  def header_category
    @parents = Category.roots
    @search = Item.ransack(params[:q])
  end

  private
  def items_params
    params.require(:item).permit(:title, :explanation, :status_id, :price, :category_id, :brand_id, :sizetype_id, delivery_attributes:[:deliveryfee_id, :deliverysource_id, :deliverymethod_id, :deliverydate_id], images_attributes: [:image] )
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_params
    params.require(:q).permit!
  end

end
