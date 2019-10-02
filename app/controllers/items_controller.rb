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
    end
  end
  
  def show
  end
  
  def edit
  end

  def update
    #ログイン機能実装前なのでコメントアウトしてあります
    # if @item.user_id == current_user.id
      @item.update(items_params)
    begin
      redirect_to action: :show
    rescue ActiveRecord::RecordNotFound => e
      render 'errors/error_404', status: :not_found
      
    end
  
  end
  
def destroy
  # if @item.user_id == current_user.id
  @item.destroy
  begin
    redirect_to root_path
  rescue ActiveRecord::RecordNotFound => e
    render 'errors/error_404', status: :not_found
end
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
    params.require(:item).permit(:title, :explanation, :status_id, :price, :category_id, :brand_id, delivery_attributes:[:id, :deliveryfee_id,:deliverysource_id,:deliverymethod_id,:deliverydate_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
