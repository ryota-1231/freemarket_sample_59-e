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
  end
end