require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)

  end

  describe 'ユーザー新規登録' do
      
    context '新規登録できる場合' do
      it "全ての値が存在すれば登録できる" do
        expect(@item).to be_valid
    end
  end

    context '新規登録できない場合' do

      it "nameが空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "内容が空では登録できない" do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end

      it "カテゴリーが空では登録できない" do
        @item.genre_id  = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end

      it "状態が空では登録できない" do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it "配送料が空では登録できない" do
        @item.deriver_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deriver cost can't be blank")
      end

      it "配送元が空では登録できない" do
        @item.prefecture_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "配送日が空では登録できない" do
        @item.deriver_day_id = ''
        @item.valid?

        expect(@item.errors.full_messages).to include("Deriver day can't be blank")
      end
      
        it "価格が空では登録できない" do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        
    
    end
  end

end

