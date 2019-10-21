class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index 
    #id仮置きです
    if Card.where(user_id: current_user.id).present?
      @card = Card.where(user_id: current_user.id).first 
    end    
    @buyer = current_user
    Payjp.api_key = "sk_test_be508ed036c9c40e55488d6a"
    customer = Payjp::Customer.retrieve(@card.buyer_id)
    @card_information = customer.cards.retrieve(@card.card_number)
    session[:item_id] = params[:item_id]
    # @cards = Card.where(user_id: current_user.id).last
  end


  def new 
    card = Card.where(user_id: current_user.id).last
    # redirect_to action: "index" if card.present?
  end


  def create 
    Payjp.api_key = 'sk_test_be508ed036c9c40e55488d6a'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        card: params['payjp-token'],
      )
      # @card = Card.new(user_id: current_user.id, buyer_id: customer.id, card_number: customer.default_card, month: 3, year: 22,secure: 123)
      @card = Card.create(user_id: current_user.id,buyer_id: customer.id, card_number: customer.default_card)
      if @card.save
        if session[:item_id].present?
          redirect_to new_user_confirmation_path(session[:item_id])
        else  
          redirect_to "/cards"
        end
      else
        redirect_to action: "create"
      end
    end
  end

  private

  def set_card
    @card = Card.where(user_id: 1).first if Card.where(user_id: current_user.id).present?
  end
end

