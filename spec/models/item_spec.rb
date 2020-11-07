require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/camera.png')
  end

  describe '商品出品機能' do
    context '商品の出品がうまくいくとき' do
      it 'image, name, text, category_id, shipping_fee_id, shipping_from_id, shipping_day_id, priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'category_id, shipping_fee_id, shipping_from_id, shipping_day_idのvalueが1以上なら登録できる' do
        @item.category_id = 1
        @item.shipping_fee_id = 1
        @item.shipping_from_id = 1
        @item.shipping_day_id = 1
        expect(@item).to be_valid
      end
      it 'priceが半角数字で 300 ~ 9,999,999 の間であれば出品できる' do
        @item.price = 5000
        expect(@item).to be_valid
      end
    end

    context '商品の出品がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idのvalueが0だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'condition_idのvalueが0だと出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end
      it 'shipping_fee_idのvalueが0だと出品できない' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee Select')
      end
      it 'shipping_from_idのvalueが0だと出品できない' do
        @item.shipping_from_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping from Select')
      end
      it 'shipping_day_idのvalueが0だと出品できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day Select')
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが 300以上でないと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが 9,999,999以下でないと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角数字でないと出品できない' do
        @item.price = '全角'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
