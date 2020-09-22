require 'rails_helper'

RSpec.describe OrderAddressForm, type: :model do

  describe '#create' do
     before do
      @order = FactoryBot.build(:order_address_form)
    end

    context "購入登録できる場合" do

      it "buildeng以外の全ての項目が存在すれば登録できること" do
        @order.building = nil
        expect(@order).to be_valid
      end

      it "postal_codeが半角数字であり、ハイフンを含んでいれば登録できること" do
        @order.postal_code = "123-4567"
        expect(@order).to be_valid
      end

      it "prefecture_idが2から48の間であれば登録できること" do
        @order.prefecture_id = 2
        expect(@order).to be_valid
      end

      it "phone_numberが半角数字で11桁以内であれば登録できること" do
        @order.phone_number = "09012345678"
        expect(@order).to be_valid
      end
    end

    context "購入登録できない場合" do

      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空では登録できないこと" do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeが半角数字以外の文字列であれば登録できないこと" do
        @order.postal_code = "１２３−４５６７"
        @order.postal_code = "abc-defg"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeがハイフンを含んでいなければ登録できないこと" do
        @order.postal_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it "prefecture_idが1では登録できないこと" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "cityが空では登録できないこと" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空では登録できないこと" do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空では登録できないこと" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberが半角数字以外では登録できないこと" do
        @order.phone_number = "abcdefghi"
        @order.phone_number = "０９０１２３４５６７８"
        @order.phone_number = "山寺宏一"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end