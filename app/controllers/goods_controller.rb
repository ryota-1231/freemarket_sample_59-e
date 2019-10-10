class GoodsController < ApplicationController

  before_action :set_item

  def create
    @good = current_user.goods.create(item_id: params[:item_id])
    render 'goods_ajax.js.erb'
    # redirect_to "/items/#{params[:item_id]}"
  end

  def destroy
    @un_good = Good.find_by(item_id: params[:item_id], user_id: current_user.id)
    @un_good.destroy
    # redirect_to "/items/#{params[:item_id]}"
    redirect_to 'un_goods_ajax.js.erb'
  end

  def set_item
    @item = Item.find(params[:item_id])
    # @id_name = "#good-link-#{@item.id}"
    # @id_heart = "#heart-#{@item.id}"
  end

end
