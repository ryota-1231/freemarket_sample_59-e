class GoodsController < ApplicationController
  def create
    @good = current_user.goods.create!(item_id: params[:item_id])
    redirect_to "/items/#{params[:item_id]}"
  end

  def destroy
    @good = Good.find_by(item_id: params[:item_id], user_id: current_user.id)
    @like.destroy
    redirect_to "/items/#{params[:item_id]}"
  end
end
