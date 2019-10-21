require 'rails_helper'

  describe ItemsController do

    describe '#create' do
      it "is invalid without a deliveryfee_id" do
        @delivery = build(:delivery, deliveryfee_id: "")
        @delivery.valid?
        expect(@delivery.errors[:deliveryfee_id]).to include("can't be blank")
      end

      it "is invalid with a deliveryfee_id only numbers can " do
        @delivery = build(:delivery, deliveryfee_id: "aaa")
        @delivery.valid?
        expect(@delivery.errors[:deliveryfee_id]).to include("is not a number")
      end

      it "is invalid without a deliverysource_id" do
        @delivery = build(:delivery, deliverysource_id: "")
        @delivery.valid?
        expect(@delivery.errors[:deliverysource_id]).to include("can't be blank")
      end

      it "is invalid with a deliverysource_id only numbers can " do
        @delivery = build(:delivery, deliverysource_id: "aaa")
        @delivery.valid?
        expect(@delivery.errors[:deliverysource_id]).to include("is not a number")
      end

      it "is invalid without a deliverymethod_id" do
        @delivery = build(:delivery, deliverymethod_id: "")
        @delivery.valid?
        expect(@delivery.errors[:deliverymethod_id]).to include("can't be blank")
      end
    
      it "is invalid with a deliverymethod_id only numbers can " do
        @delivery = build(:delivery, deliverymethod_id: "aaa")
        @delivery.valid?
        expect(@delivery.errors[:deliverymethod_id]).to include("is not a number")
      end

      it "is invalid without a deliverydate_id" do
        @delivery = build(:delivery, deliverydate_id: "")
        @delivery.valid?
        expect(@delivery.errors[:deliverydate_id]).to include("can't be blank")
      end
        
      it "is invalid with a deliverydate_id only numbers can " do
        @delivery = build(:delivery, deliverydate_id: "aaa")
        @delivery.valid?
        expect(@delivery.errors[:deliverydate_id]).to include("is not a number")
      end

  end
end