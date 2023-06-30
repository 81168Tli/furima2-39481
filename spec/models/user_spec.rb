require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    describe 'ユーザー新規登録' do
      
      context '新規登録できる場合' do
        it "全ての値が存在すれば登録できる" do
          expect(@user).to be_valid
      end
    end

      context '新規登録できない場合' do

        it "nicknameが空では登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

      it "メールアドレスが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "保存するメールアドレスの重複がないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it "メールアドレスに＠を含むこと" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end


      it "パスワードが必要なこと" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")

      end
      it "パスワード６文字以上必要な事" do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')

      end

      it "パスワードは英字のみで登録不可な事" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must include at least one letter and one digit")

      end

      it "パスワードは全角文字では登録不可な事" do
        @user.password = 'Ａaa123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must include at least one letter and one digit")

      end

      it "パスワードは数字のみで登録不可な事" do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must include at least one letter and one digit")

      end

      it "パスワードとパスワード（確認）は、値の一致が必須であること。" do
        @user.password = 'a12345'
        @user.password_confirmation = 'a123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "お名前(全角)は、名字が必須であること " do
        @user.lastname1 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname1 can't be blank")

      end

      it "お名前(全角)は、名前が必須であること " do
        @user.firstname1 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname1 can't be blank")

      end

      it "お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること " do
        @user.lastname1 = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname1 is invalid")

      end

      it "お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること " do
        @user.firstname1 = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname1 is invalid")

      end

      it "お名前カナ(全角)は、名字と名前がそれぞれ必須であること " do
        @user.lastname2 = 'ﾃｽﾄ'
        @user.firstname2 = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname2 is invalid")

      end

      it "お名前カナ(全角)は、名字と名前がそれぞれ必須であること " do
        @user.firstname2 = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname2 is invalid")

      end

      it "お名前カナ(全角)は、全角（カタカナ）での入力が必須であること " do
        @user.lastname2 = ''
        @user.firstname2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname2 is invalid")

      end


      it "お名前カナ(全角)は、全角（カタカナ）での入力が必須であること " do
        @user.firstname2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname2 is invalid")

      end

      it "生年月日が必須であること " do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")

      end
    end
  end
end