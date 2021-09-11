require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '送付情報の保存' do
    before do
      @order_destination = FactoryBot.build(:order_destination)
    end

    context '送付情報の保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end
    end

    context '送付情報の保存がうまくいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @order_destination.postal_code = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_destination.postal_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_destination.prefecture = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityは空だと保存できないこと' do
        @order_destination.city = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'ad_detailは空だと保存できないこと' do
        @order_destination.ad_detail = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Ad detail can't be blank")
      end
      it 'buildingは空でも保存できること' do
        @order_destination.building = nil
        expect(@order_destination).to be_valid
      end
      it 'phoneが空だと保存できないこと' do
        @order_destination.phone = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone can't be blank", 'Phone is invalid')
      end
      it 'phoneはハイフン不要で、11桁以内でないと保存できないこと' do
        @order_destination.phone = '0123456789123'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneはハイフン不要で、9桁以下では保存できないこと' do
        @order_destination.phone = '123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneは半角数字以外が含まれている場合は購入できない' do
        @order_destination.phone = '0123456789あ'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
