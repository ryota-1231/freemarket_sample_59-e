class ConfirmationController < ApplicationController
  before_action :header_category
  
  def new
    #id仮置きです
    if session[:item_id]
      @item = Item.find(session[:item_id])
    else
      @item = Item.find(params[:item_id])
    end

    @user = @item.user   
    if Card.where(user_id: current_user.id).present?
      @card = Card.where(user_id: current_user.id).last
    end    
    @buyer = current_user
    Payjp.api_key = "sk_test_be508ed036c9c40e55488d6a"
    customer = Payjp::Customer.retrieve(@card.buyer_id)
    @card_information = customer.cards.retrieve(@card.card_number)
    session[:item_id] = params[:item_id]
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user_id = current_user.id
    user.addresses.update(
      postcode: user_params[:addresses_attributes]["0"][:postcode],
      prefecture_id: user_params[:addresses_attributes]["0"][:prefecture_id],
      city: user_params[:addresses_attributes]["0"][:city],
      block: user_params[:addresses_attributes]["0"][:block],
      building: user_params[:addresses_attributes]["0"][:building]
    )
    redirect_to user_path
  end

  def header_category
    @parents= Category.roots
    @search= Item.ransack(params[:q])
  end

  private
  def user_params
    params.require(:user).permit(
      :address_last_name,
      :address_first_name,
      :address_last_name_kana,
      :address_first_name_kana,
      :phone_number,
      addresses_attributes: [:postcode, :city, :block, :building, :prefecture_id]
    )
  end

end
