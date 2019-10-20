class SignupController < ApplicationController
  before_action :header_category
  
  def new
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def update
    user = User.find(params[:user_id])
    user_id = current_user.id
    user.update(
      address_last_name: user_params[:address_last_name],
      address_first_name: user_params[:address_first_name],
      address_last_name_kana: user_params[:address_last_name_kana],
      address_first_name_kana: user_params[:address_first_name_kana],
      phone_number: user_params[:phone_number]
    )
    user.addresses.update(
      postcode: user_params[:addresses_attributes]["0"][:postcode],
      prefecture_id: user_params[:addresses_attributes]["0"][:prefecture_id],
      city: user_params[:addresses_attributes]["0"][:city],
      block: user_params[:addresses_attributes]["0"][:block],
      building: user_params[:addresses_attributes]["0"][:building]
    )
    redirect_to user_path(current_user.id)
  end

  def outsidemember
    @user = User.new
  end


  def member
    @user = User.new
  end

  def phonenumber
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthdate_year] = user_params[:birthdate_year]
    session[:birthdate_month] = user_params[:birthdate_month]
    session[:birthdate_day] = user_params[:birthdate_day]
    @user = User.new
  end

  def address
    session[:cellphone_number] = user_params[:cellphone_number]
    @user = User.new
    @user.addresses.build
  end

  def paymethod
    session[:address_last_name] = user_params[:address_last_name]
    session[:address_first_name] = user_params[:address_first_name]
    session[:address_last_name_kana] = user_params[:address_last_name_kana]
    session[:address_first_name_kana] = user_params[:address_first_name_kana]
    session[:postcode] = user_params[:addresses_attributes]["0"][:postcode]
    session[:prefecture_id] = user_params[:addresses_attributes]["0"][:prefecture_id]
    session[:city] = user_params[:addresses_attributes]["0"][:city]
    session[:block] = user_params[:addresses_attributes]["0"][:block]
    session[:building] = user_params[:addresses_attributes]["0"][:building]
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthdate_year: session[:birthdate_year],
      birthdate_month: session[:birthdate_month],
      birthdate_day: session[:birthdate_day],
      cellphone_number: session[:cellphone_number],
      address_last_name: session[:address_last_name],
      address_first_name: session[:address_first_name],
      address_last_name_kana: session[:address_last_name_kana],
      address_first_name_kana: session[:address_first_name_kana],
      phone_number: session[:phone_number]
      # card_number: user_params[:card_number],
      # expiration_year: user_params[:expiration_year],
      # expiration_month: user_params[:expiration_month]
    )
    @user.addresses.build(
      postcode: session[:postcode],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      block: session[:block],
      building: session[:building]
    )
    Payjp.api_key = 'sk_test_be508ed036c9c40e55488d6a'
    customer = Payjp::Customer.create(
      description: 'test', 
      card: params['payjp-token']
    )
    @card = Card.new(buyer_id: customer.id, card_number: customer.default_card)
    if @user.save
      session[:id] = @user.id
      @card.user_id = session[:id]
      @card.save
      redirect_to done_signup_index_path
    else
      render '/users/new'
    end  
  end

  private
    def user_params

      params.require(:user).permit(
        :nickname,
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :address_last_name,
        :address_first_name,
        :address_last_name_kana,
        :address_first_name_kana,
        :email,
        :phone_number,
        :cellphone_number,
        :birthdate_year,
        :birthdate_month,
        :birthdate_day,
        :card_number,
        :expiration_year,
        :expiration_month,
        :password,
        :password_confirmation,
        addresses_attributes: [:postcode, :city, :block, :building, :prefecture_id]
    )
    end

    def header_category
      @parents= Category.roots
      @search= Item.ransack(params[:q])
    end

end
