class GoodsController < ApplicationController

  before_action :set_item, only: [:create, :destroy]

  def create
    @good = current_user.goods.new(item_id: params[:item_id],user_id: current_user.id)
    @good.save!
    render 'goods_ajax.js.erb'
  end

  def destroy
    @un_good = Good.find_by(item_id: params[:item_id], user_id: current_user.id)
    @un_good.destroy

    render 'un_goods_ajax.js.erb'

  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

end
