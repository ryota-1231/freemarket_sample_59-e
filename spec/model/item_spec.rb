
# require 'rails_helper'

# describe Item do
#   describe '#create' do
#     it "is invalid without a title" do
#       item = Item.new(title: "", explanation: "aaa", category_id: 11, status:2, delivery_id:1, brand_id:1, price: 1000)
#       item.valid?
#       expect(item.errors[:title]).to include("can't be blank")
#      end

#      it "is invalid without a explanation" do
#       item = Item.new(title: "aaa", explanation: "", category_id: 11,status:2, delivery_id:1, brand_id:1,price: 1000)
#       item.valid?
#       expect(item.errors[:explanation]).to include("can't be blank")
#      end

#      it "is invalid without a status" do
#       item = Item.new(title: "aaa", explanation: "aaa", category_id: 1,status:"", delivery_id:1, brand_id:1,price: 1000)
#       item.valid?
#       expect(item.errors[:status]).to include("can't be blank")
#      end

#      it "is invalid without a category_id" do
#       item = Item.new(title: "aaa", explanation: "aaa", category_id: "",status:2, delivery_id:1, brand_id:1,price: 1000)
#       item.valid?
#       expect(item.errors[:category_id]).to include("can't be blank")
#      end

#      it "is invalid without a delivery_id" do
#       item = Item.new(title: "aaa", explanation: "aaa", category_id: 1,status:2, delivery_id:"", brand_id:1,price: 1000)
#       item.valid?
#       expect(item.errors[:delivery_id]).to include("can't be blank")
#      end

#      it "is invalid with a delivery_id only numbers can " do
#       item = Item.new(title: "aaa", explanation: "aaa", category_id: 1,status:1,delivery_id:"aaa", brand_id:1,price: 300)
#       item.valid?
#       expect(item.errors[:delivery_id]).to include("is not a number")
#     end

#      it "is invalid with a category_id only numbers can " do
#       item = Item.new(title: "aaa", explanation: "aaa", category_id: "sss",status:1,delivery_id:1, brand_id:1,price: 300)
#       item.valid?
#       expect(item.errors[:category_id]).to include("is not a number")
#     end

#      it "is valid without a brand_id" do
#       item = Item.new(title: "aaa", explanation: "aaa", category_id: 1,status:2, delivery_id:1, brand_id:"",price: 1000)
#       item.valid?
#       expect(item).to be_valid
#      end

#      it "is invalid with a title that has more than 41 characters " do
#       item = Item.new(title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", explanation: "aaa", category_id: 1,status:2, delivery_id:1, brand_id:"1",price: 1000)
#       item.valid?
#       expect(item.errors[:title][0]).to include("is too long")
#     end

#      it "is valid with a title that has less than 40 characters " do
#       item = Item.new(title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", explanation: "aaa", category_id: 1,status:2, delivery_id:1, brand_id:"1",price: 1000)
#       item.valid?
#       expect(item).to be_valid
#     end

#       it "is invalid with a price only numbers can " do
#         item = Item.new(title: "aaa", explanation: "aaa", category_id: 1,status:2, delivery_id:1, brand_id:"1",price: "eee")
#         item.valid?
#         expect(item.errors[:price]).to include("is not a number")
#       end

#       it "is invalid with a price that has more than 9999999 characters " do
#         item = Item.new(title: "aaa", explanation: "aaa", category_id: 1,status:2, delivery_id:1, brand_id:"1",price: 9999999)
#         item.valid?
#         expect(item).to be_valid
#       end
  
#        it "is valid with a price that has less than 10000000 characters " do
#         item = Item.new(title: "aaa", explanation: "aaa", category_id: 1,status:2, delivery_id:1, brand_id:"1",price: 10000000)
#         item.valid?
#         expect(item.errors[:price]).to include("must be less than or equal to 9999999")
#       end

#       it "is valid with a price that has more than 299 characters " do
#         item = Item.new(title: "aaa", explanation: "aaa", category_id: 1,status:2, delivery_id:1, brand_id:"1",price: 299)
#         item.valid?
#         expect(item.errors[:price]).to include("must be greater than or equal to 300")
#       end
  
#        it "is invalid with a price that has less than 10000000 characters " do
#         item = Item.new(title: "aaa", explanation: "aaa", category_id: 1,status:2, delivery_id:1, brand_id:"1",price: 300)
#         item.valid?
#         expect(item).to be_valid
#       end

#       it "is invalid with a status only numbers can " do
#         item = Item.new(title: "aaa", explanation: "aaa", category_id: 1,status:"aaa", delivery_id:1, brand_id:"1",price: 300)
#         item.valid?
#         expect(item.errors[:status]).to include("is not a number")
#       end


      


#   end
# end