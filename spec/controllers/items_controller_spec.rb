require 'rails_helper'


describe ItemsController, type: :controller do
  describe "GET #index" do
    describe 'GET #index' do
      it "indexアクションが動いた時にindex.html.hamlにページが移動したか" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe '#create' do
    it "is invalid without a title" do
      @item = build(:item, title: "")
      @item.valid?
      expect(@item.errors[:title]).to include("can't be blank")
    end

    it "is invalid with a title that has more than 41 characters " do
      @item = build(:item, title: "aaaaaaaaaassssssssssddddddddddffffffffffg")
      @item.valid?
      expect(@item.errors[:title]).to include("is too long (maximum is 40 characters)")
    end

    it "is valid with a title that has less than 40 characters " do
      @item = build(:item, title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(@item).to be_valid
    end

    it "is invalid without an explanation" do
      @item = build(:item, explanation: "")
      @item.valid?
      expect(@item.errors[:explanation]).to include("can't be blank")
    end

    it "is invalid with an explanation that has more than 1001 characters" do
      @item = build(:item, explanation: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzq")
      @item.valid?
      expect(@item.errors[:explanation]).to include("is too long (maximum is 1000 characters)")
    end

    it "is valid with an explanation that has less than 1000 characters" do
      @item = build(:item, explanation: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzq")

      expect(@item).to be_valid
    end

    it "is invalid without a status_id" do
      @item = build(:item, status_id: "")
      @item.valid?
      expect(@item.errors[:status_id]).to include("can't be blank")
    end

    it "is invalid with a status_id that is not a number" do
      @item = build(:item, status_id: "a")
      @item.valid?
      expect(@item.errors[:status_id]).to include("is not a number")
    end

    it "is invalid with a price that has more than 10000000 " do
      @item = build(:item, price: "10000000")
      @item.valid?
      expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "is invalid with a price that has less than 299 " do
      @item = build(:item, price: "299")
      @item.valid?
      expect(@item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "is invalid with a price that is not a number " do
      @item = build(:item, price: "aaaaa")
      @item.valid?
      expect(@item.errors[:price]).to include("is not a number")
    end

    it "is invalid without a category_id" do
      @item = build(:item, category_id: "")
      @item.valid?
      expect(@item.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid with a category_id that is not a number" do
      @item = build(:item, category_id: "a")
      @item.valid?
      expect(@item.errors[:category_id]).to include("is not a number")
    end
  end
end  

