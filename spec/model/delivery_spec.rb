# require 'rails_helper'

#   describe Item do
#     describe '#create' do

#       it "is invalid without a delivery_fee" do
#         delivery = Delivery.new(delivery_fee:"", delivery_source:3, delivery_method:1, delivery_date:1)
#         delivery.valid?
#         expect(delivery.errors[:delivery_fee]).to include("can't be blank")
#       end

#       it "is invalid with a delivery_fee only numbers can " do
#         delivery = Delivery.new(delivery_fee:"aaa", delivery_source:3, delivery_method:1, delivery_date:1)
#         delivery.valid?
#         expect(delivery.errors[:delivery_fee]).to include("is not a number")
#       end

#       it "is invalid without a delivery_source" do
#         delivery = Delivery.new(delivery_fee:1, delivery_source:"", delivery_method:1, delivery_date:1)
#         delivery.valid?
#         expect(delivery.errors[:delivery_source]).to include("can't be blank")
#       end

#       it "is invalid with a delivery_source only numbers can " do
#         delivery = Delivery.new(delivery_fee:1, delivery_source:"aaa",delivery_method:1, delivery_date:1)
#         delivery.valid?
#         expect(delivery.errors[:delivery_source]).to include("is not a number")
#       end

#       it "is invalid without a delivery_method" do
#         delivery = Delivery.new(delivery_fee:1, delivery_source:1, delivery_method:"", delivery_date:1)
#         delivery.valid?
#         expect(delivery.errors[:delivery_method]).to include("can't be blank")
#       end

#       it "is invalid with a delivery_method only numbers can " do
#         delivery = Delivery.new(delivery_fee:1, delivery_source:1,delivery_method:"www", delivery_date:1)
#         delivery.valid?
#         expect(delivery.errors[:delivery_method]).to include("is not a number")
#       end

#       it "is invalid without a delivery_date" do
#         delivery = Delivery.new(delivery_fee:1, delivery_source:1, delivery_method:1, delivery_date:"")
#         delivery.valid?
#         expect(delivery.errors[:delivery_date]).to include("can't be blank")
#       end

#       it "is invalid with a delivery_date only numbers can " do
#         delivery = Delivery.new(delivery_fee:1, delivery_source:1,delivery_method:1, delivery_date:"WWW")
#         delivery.valid?
#         expect(delivery.errors[:delivery_date]).to include("is not a number")
#       end

#   end
# end