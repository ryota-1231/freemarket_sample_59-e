class UsersController < ApplicationController
  before_action :header_category

  def new
  end
  
  def show
    @items = Item.where(user_id: current_user.id)
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update! params.require(:user).permit(:nickname, :introduction, :avatar)
    redirect_to action: :show
  end

  def destroy
    @user = current_user.id
  end

  def log_out
    @user = User.find(params[:format])
  end

  def register
    @user = current_user.id
    @card = Card.where(user_id: current_user.id).last if Card.where(user_id: current_user.id).present?
    customer = Payjp::Customer.retrieve(@card.buyer_id)
    @card_information = customer.cards.retrieve(@card.card_number)
  end 

  def sms_confirmation
    @user = current_user
  end

  def exhibit
    @user = User.find(current_user.id)
    @items = Item.where(user_id: current_user.id)
    @items_purchase = @items.where(purchase: "exhibit")
  end

  def trading
    @user = User.find(current_user.id)
    @items = Item.where(user_id: current_user.id)
    @items_purchase = @items.where(purchase: "trading")
  end

  def soldout
    @user = User.find(current_user.id)
    @items = Item.where(user_id: current_user.id)
    @items_purchase = @items.where(purchase: "soldout")
  end


  def header_category
    @parents = Category.roots
    @search = Item.ransack(params[:q])
  end
end