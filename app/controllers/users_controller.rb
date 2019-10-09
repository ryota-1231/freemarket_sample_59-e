class UsersController < ApplicationController

  def new
  end
  
  def show
    @user = User.find(current_user.id)
    @nickname = @user.nickname
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
  
end