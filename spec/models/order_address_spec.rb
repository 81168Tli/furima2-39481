require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '情報の保存' do
    

    context '内容に問題ない場合' do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@order_address).to be_valid

      end
    
    end

    context '内容に問題がある場合' do
      it "post_codeが空だと保存できないこと" do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")

      end

      it "cityは空不可" do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")

      end
      it "s_numは空不可" do

        @order_address.s_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("S num can't be blank")

      end
      it "build_name空不可" do
        @order_address.build_name = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Build name can't be blank")

      end

      it "tel空不可" do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")

      end



      it "prefectureを選択していないと保存できないこと" do
          @order_address.prefecture_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
  
        end
   
      it "userが紐付いていないと保存できないこと" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it "itemが紐付いていないと保存できないこと" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
