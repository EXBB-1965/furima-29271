require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "imageが空では出品できないこと" do
      @item.image = nil
      @item.valid?
        expect(@item.errors.full_messages).to include("Image Please attach a jpeg file of a png file to the image")
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
      @item.price = 0
      @item.price = 10000000
      @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "priceが全角文字では出品できないこと" do
      @item.price = "全角"
      @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end









