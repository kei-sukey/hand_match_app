require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '#create' do
    context '作品出品ができる場合' do
      it '必要な情報を適切に入力すると作品出品できること' do
        expect(@item).to be_valid
      end
    end

    context '作品出品ができない場合' do
      it '画像が空だと作品出品ができないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '作品名が空欄では作品出品ができないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("作品名を入力してください")
      end

      it '作品説明が空欄では作品出品ができないこと' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("作品説明を入力してください")
      end

      it 'カテゴリー情報がないと作品出品ができないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it 'カテゴリー情報が「---」だと作品出品ができないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it '色の情報がないと作品出品ができないこと' do
        @item.color_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("色を選択してください")
      end

      it '色の情報が「---」だと商品出品ができないこと' do
        @item.color_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("色を選択してください")
      end

      it '素材の情報がないと作品出品ができないこと' do
        @item.material_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("素材を選択してください")
      end

      it '素材の情報が「---」だと商品出品ができないこと' do
        @item.material_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("素材を選択してください")
      end

      it 'サイズの情報がないと作品出品ができないこと' do
        @item.size_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("サイズを選択してください")
      end

      it 'サイズの情報が「---」だと商品出品ができないこと' do
        @item.size_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("サイズを選択してください")
      end

      it '配送料の負担についての情報がないと商品出品ができないこと' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料負担を選択してください")
      end

      it '配送料の負担についての情報が「---」だと商品出品ができないこと' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料負担を選択してください")
      end

      it '発送元の地域についての情報がないと商品出品ができないこと' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県を選択してください")
      end

      it '発送元の地域についての情報が「---」だと商品出品ができないこと' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県を選択してください")
      end

      it '発送までの日数についての情報がないと商品出品ができないこと' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it '発送までの日数についての情報が「---」だと商品出品ができないこと' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it '販売価格が空欄だと商品出品ができないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it '販売価格が300円未満だと商品出品ができないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は¥300〜9,999,999の範囲で設定してください")
      end

      it '販売価格が9,999,999円を超えると商品出品ができないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は¥300〜9,999,999の範囲で設定してください")
      end

      it '販売価格が半角数字でないと商品出品ができないこと' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は半角数字で入力してください")
      end
    end
  end
end
