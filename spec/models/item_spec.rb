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
        expect(@item).not_to be_valid
      end
      
      it '商品名が空では出品できない' do
        @item.name = ''
        expect(@item).not_to be_valid
      end
      
      it '商品説明が空では出品できない' do
        @item.content = ''
        expect(@item).not_to be_valid
      end
      
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.genre_id = nil
        expect(@item).not_to be_valid
      end
      
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.state_id = nil
        expect(@item).not_to be_valid
      end
      
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.deriver_cost_id = nil
        expect(@item).not_to be_valid
      end
      
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = nil
        expect(@item).not_to be_valid
      end
      
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.deriver_day_id = nil
        expect(@item).not_to be_valid
      end
      
      it '価格が空では出品できない' do
        @item.price = nil
        expect(@item).not_to be_valid
      end
      
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '1000a'
        expect(@item).not_to be_valid
      end
      
      it '価格が300円未満では出品できない' do
        @item.price = 299
        expect(@item).not_to be_valid
      end
      
      it '価格が9_999_999円を超えると出品できない' do
        @item.price = 10_000_000
        expect(@item).not_to be_valid
      end
      
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        expect(@item).not_to be_valid
      end
    end
  end
end