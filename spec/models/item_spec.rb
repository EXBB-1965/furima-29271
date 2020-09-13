require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item, user_id: 1, )
    end

    context "商品出品できる場合" do

      it "全ての項目が存在すれば登録できること" do
      expect(@item).to be_valid
      end

      it "category_idが2から11の間であれば出品できること" do
        @item.category_id = 2
        expect(@item).to be_valid
      end

      it "status_idが2から7の間であれば出品できること" do
        @item.category_id = 2
        @item.category_id = 7
        expect(@item).to be_valid
      end

      it "payer_idが2から3の間であれば出品できること" do
        @item.category_id = 2
        @item.category_id = 3
        expect(@item).to be_valid
      end

      it "prefecture_idが2から48の間であれば出品できること" do
        @item.prefecture_id = 2
        @item.prefecture_id = 48
        expect(@item).to be_valid
      end

      it "shipping_day_idが2から4の間であれば出品できること" do
        @item.shipping_day_id = 2
        @item.shipping_day_id = 4
        expect(@item).to be_valid
      end

      it "priceが300から9999999の間であれば出品できること" do
        @item.price = 300
        @item.price = 9999999
        expect(@item).to be_valid
      end

      it "priceが半角数字であれば出品できること" do
        @item.price = 300
        expect(@item).to be_valid
      end

    end

    context "商品出品できない場合" do

      it "imageが空では出品できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空では出品できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "discriptionが空では出品できないこと" do
        @item.discription = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Discription can't be blank")
      end

      it "category_idが1では出品できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "status_idが1では出品できないこと" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "payer_idが1では出品できないこと" do
        @item.payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Payer must be other than 1")
      end

      it "prefecture_idが1では出品できないこと" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "shipping_day_idが1では出品できないこと" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it "priceが空では出品できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
     end

      it "priceが300から9999999の間でなければ出品できないこと" do
        @item.price = 299
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "priceが半角数字以外では出品できないこと" do
        @item.price = "全角ぜんかくゼンカク３００"
        @item.price = "hankaku"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end

  end

end









