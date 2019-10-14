class UsersController < ApplicationController
  before_action :header_category

  def new
  end
  
  def show
    @user = User.find(current_user.id)
    @nickname = @user.nickname
    @items_exhibit = @user.items.where(purchase: "exhibiting")
  end
  
  def edit
    @user = current_user.id
  end

  def destroy
    @user = current_user.id
  end

  def log_out
    @user = current_user.id
  end

  def register
    @user = current_user.id
  end 

  def sms_confirmation
    @user = current_user
  end

  def address_alter
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