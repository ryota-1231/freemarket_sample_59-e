class UsersController < ApplicationController

  def new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update! params.require(:user).permit(:avatar, :nickname, :last_name)
    redirect_to action: :show
    
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

  def profile
    @user = current_user.id
  end  

  # private
  # def user_params
  #   params.permit(:nickname, :avatar, :last_name)
  # end
  
end