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
  end 

  def sms_confirmation
    @user = current_user
  end

  def exhibit
    @user = User.find(current_user.id)
  end

  def trading
    @user = User.find(current_user.id)
  end

  def soldout
    @user = User.find(current_user.id)
  end


  def header_category
    @parents = Category.roots
    @search = Item.ransack(params[:q])
  end
end