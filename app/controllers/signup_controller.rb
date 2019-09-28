class SignupController < ApplicationController

  def new
  end

  def member
    @user = User.new
  end

  def phonenumber
    session[:email] = user_params[:email]
    @user = User.new
  end

  def address
    @user = User.new
  end

  def paymethod
    @user = User.new
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end
  
  def create
    @user = User.new(
      email: session[:email]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/users/new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email)
    end
end
