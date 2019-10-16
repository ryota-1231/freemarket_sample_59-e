class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index 
    #id仮置きです
    @cards = Card.find(1)
  end

#後から削除ボタンを実装したくなったら使います。
  # def destroy
  #   Payjp.api_key = "sk_test_be508ed036c9c40e55488d6a"
  #   buyer = Payjp::Customer.retrieve(@card.buyer_id)
  #   buyer.delete
  #   if @card.destroy
  #     redirect_to action: "index", notice: "削除しました"
  #   else 
  #     redirect_to action: "index", alert: "削除できませんでした"
  #   end
  # end


  def new 
    #id仮置きです
    card = Card.where(user_id: 2)
    redirect_to action: "index" if card.present?
  end


  def create 
    Payjp.api_key = 'sk_test_be508ed036c9c40e55488d6a'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: 'test', 
        # email: "ponkotu2019@gmail.com",
        card: params['payjp-token'],
        metadata:{user_id: current_user.id}
      )
      #id仮置きです
      @card = Card.new(user_id: current_user.id, buyer_id: customer.id, card_number: customer.default_card)
      binding.pry
      if @card.save
        
        redirect_to action: 'index'
      else
        redirect_to action: "create"
      end
    end
  end

  private

  def set_card
    #id仮置きです
    @card = Card.where(user_id: 1).first if Card.where(user_id: current_user.id).present?
  end
end

