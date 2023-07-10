require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end

  describe '出品' do
    context '正常系' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    
    context '異常系' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")      
      end
      
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")      
      end
      
      it '商品説明が空では出品できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")

      end
      
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.deriver_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deriver cost can't be blank")
      end
      
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.deriver_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deriver day can't be blank")
      end
      
      it '価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '1000a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      
      it '価格が300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      
      it '価格が9_999_999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end