class ConfirmationController < ApplicationController

  def new
    #id仮置きです
    @item = Item.find(params[:item_id])
    @user = @item.user
    @cards = Card.find(1)
    @buyer = current_user
  end

end
