require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @orderaddress = FactoryBot.build(:order_address)
    end

    context '購入ができるとき' do

      it "全てが正常であれば登録できる" do
        expect(@orderaddress).to be_valid
      end

      it "建物名が空でも登録できる" do
        @orderaddress.building = nil
        @orderaddress.valid?
        expect(@orderaddress).to be_valid
      end

    end



    context '購入ができないとき' do

      #トークンについてのテスト

      it "tokenが空では登録できないこと" do
        @orderaddress.token = nil
        @orderaddress.valid?
        expect( @orderaddress.errors.full_messages).to include("Token can't be blank")
      end

      #郵便番号についてのテスト

      it "郵便番号がなければ出品できない" do
        @orderaddress.postcode = nil
        @orderaddress.valid? 
        expect(@orderaddress.errors.full_messages).to include("Postcode can't be blank") 
      end

      it "郵便番号にハイフンがなければ登録できない" do
        @orderaddress.postcode = "1234567"
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Postcode is invalid")
      end

      #住所、市区町村、番地についてのテスト
      it "住所の地域の選択なければ出品できない" do
        @orderaddress.area_id = 1
        @orderaddress.valid? 
        expect(@orderaddress.errors.full_messages).to include("Area must be other than 1") 
      end

      it "市区町村がなければ出品できない" do
        @orderaddress.municipality = nil
        @orderaddress.valid? 
        expect(@orderaddress.errors.full_messages).to include("Municipality can't be blank") 
      end

      it "番地がなければ出品できない" do
        @orderaddress.address = nil
        @orderaddress.valid? 
        expect(@orderaddress.errors.full_messages).to include("Address can't be blank") 
      end

      #電話番号についてのテスト

      it "電話番号がなければ出品できない" do
        @orderaddress.tel = nil
        @orderaddress.valid? 
        expect(@orderaddress.errors.full_messages).to include("Tel can't be blank") 
      end

      it "電話番号は半角数字でなければ登録できない" do
        @orderaddress.tel = "０８０１２３４５６７８"
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Tel is invalid")
      end

      it "電話番号は数字11桁でなければ登録できない" do
        @orderaddress.tel = "0801234567"
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Tel is invalid")
      end
    end 

  end
end
