require 'rails_helper'
describe SignupController do

  describe '#create' do
    it "is invalid without an email" do
      @user = build(:user, email: "")
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      @user = create(:user)
      @another_user = build(:user, email: @user.email)
      @another_user.valid?
      expect(@another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid without a postcode" do
      @address = build(:address, postcode: "")
      @address.valid?
      expect(@address.errors[:postcode]).to include("can't be blank")
    end

    it "is invalid without a city" do
      @address = build(:address, city: "")
      @address.valid?
      expect(@address.errors[:city]).to include("can't be blank")
    end

    it "is invalid without a block" do
      @address = build(:address, block: "")
      @address.valid?
      expect(@address.errors[:block]).to include("can't be blank")
    end

    it "is invalid without a prefecture_id" do
      @address = build(:address, prefecture_id: "")
      @address.valid?
      expect(@address.errors[:prefecture_id]).to include("can't be blank")
    end
  end
end