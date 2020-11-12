require 'rails_helper'
describe AddressOrder do
  before do
    @address_order = FactoryBot.build(:address_order)
  end

  describe '商品購入情報の保存' do
    context '保存ができるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@address_order).to be_valid
      end
      it '建物名が空でも保存できる' do
        @address_order.building = ''
        expect(@address_order).to be_valid
      end
    end

    context '保存ができないとき' do
      it '郵便番号が空だと保存できない' do
        @address_order.postal_code = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが含まれていないと保存できない' do
        @address_order.postal_code = '2222222'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号が半角数字でなければ保存できない' do
        @address_order.postal_code = '２２２-２２２２'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県のIDが0だと保存できない' do
        @address_order.prefecture_id = 0
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @address_order.municipality = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと保存できない' do
        @address_order.address = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @address_order.phone_num = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone num can't be blank")
      end
      it '電話番号は11桁以内でなければ保存できない' do
        @address_order.phone_num = '090123456789'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Phone num is invalid')
      end
      it '電話番号は半角数字でなければ保存できない' do
        @address_order.phone_num = '０９０１２３４５６７８'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Phone num is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @address_order.token = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
