require 'rails_helper'

describe GoodsController do

  describe '#create' do
    it "is invalid without an user_id" do
      @good = build(:good, user_id: "")
      @good.valid?
      expect(@good.errors[:user_id]).to include("can't be blank")
    end

    it "is invalid without an item_id" do
      @good = build(:good, item_id: "")
      @good.valid?
      expect(@good.errors[:item_id]).to include("can't be blank")
    end
  end
end