require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#create' do

    before do
      @user = FactoryBot.build(:user)
    end

    context "新規登録できる場合" do

      it "全ての項目が存在すれば登録できること" do
        expect(@user).to be_valid
      end

      it "passwordが半角英数字混合で6文字以上であれば登録できること" do
        @user.password = "12345a"
        @user.password_confirmation = "12345a"
        expect(@user).to be_valid
      end

      it "last_nameとfirst_nameが全角文字であれば登録できること" do
        @user.last_name = "ハッチンソンいけだ山崎"
        @user.first_name = "トミーりょうへい貴子"
        expect(@user).to be_valid
      end

      it "last_name_kanaとfirst_name_kanaが全角カナであれば登録できること" do
        @user.last_name_kana = "ヤマダ"
        @user.first_name_kana = "タカユキ"
        expect(@user).to be_valid
      end
    end

    context "新規登録できない場合" do

      it "nicknameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
       expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@が含まれていない場合登録できないこと" do
        @user.email = "userexamle.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが半角英字だけでは登録できないこと" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが半角数字だけでは登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが全角文字では登録できないこと" do
        @user.password = "１２３４５A"
        @user.password_confirmation = "１２３４５A"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが記号を含むと登録できないこと" do
        @user.password = "1234a!"
        @user.password_confirmation = "1234a!"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordとpassword_comfirmationが完全に一致していない場合登録できないこと" do
        @user.password = "hoge123"
        @user.password_confirmation ="fuga123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "last_nameが半角文字の場合登録できないこと" do
        @user.last_name = "Yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "last_nameが空では登録できないこと" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_nameが半角文字の場合登録できないこと" do
        @user.first_name = "Hanako"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "first_nameが空では登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_name_kanaがカナ以外の全角文字では登録できないこと" do
        @user.last_name_kana = "山田やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "last_name_kanaが半角文字の場合登録できないこと" do
        @user.last_name_kana = "Yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "last_name_kanaが空では登録できないこと" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "first_name_kanaがカナ以外の全角文字では登録できないこと" do
        @user.first_name_kana = "孝之たかゆき"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "first_name_kanaが半角文字の場合登録できないこと" do
        @user.first_name_kana = "Takayuki"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "first_name_kanaが空では登録できないこと" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "birth_dateが空では登録できないこと" do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end