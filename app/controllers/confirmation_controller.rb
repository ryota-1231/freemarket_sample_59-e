class ConfirmationController < ApplicationController

  def new
    #id仮置きです
    @item = Item.find(params[:item_id])
    @user = @item.user
    @cards = Card.find(1)
    @buyer = current_user
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
