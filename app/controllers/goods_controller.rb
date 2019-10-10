class GoodsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @good = current_user.goods.create(item_id: params[:item_id])
    render 'goods_ajax.js.erb'
  end

  def destroy
    @un_good = Good.find_by(item_id: params[:item_id], user_id: current_user.id)
    @un_good.destroy
    redirect_to "/items/#{params[:item_id]}"
  end
end
