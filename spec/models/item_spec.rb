require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品ができるとき' do

      it "全てが正常であれば登録できる" do
        expect(@item).to be_valid
      end

      it "販売価格が半角数字のみ登録できる" do
        @item.price = 123456
        @item.valid?
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do

      #商品名、商品説明のテスト

      it "商品名がなければ出品できない" do
        @item.product =nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("Product can't be blank") 
      end

      it "商品説明がなければ出品できない" do
        @item.message =nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("Message can't be blank") 
      end

      #商品の詳細についてのテスト

      it "カテゴリーについて選択がなければ出品できない" do
        @item.category_id =nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("Category can't be blank") 
      end

      it "商品詳細について選択がなければ出品できない" do
        @item.status_id =nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("Status can't be blank") 
      end


      #配送についてのテスト

      it "配送料について選択がなければ出品できない" do
        @item.shipping_id =nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("Shipping can't be blank") 
      end

      it "発送元の地域について選択がなければ出品できない" do
        @item.area_id =nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("Area can't be blank") 
      end

      it "発送までの日数について選択がなければ出品できない" do
        @item.days_id =nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("Days can't be blank") 
      end

      #販売価格についてのテスト

      it "販売価格がなければ出品できない" do
        @item.price =nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price can't be blank") 
      end

      it "販売価格が半角数字以外は登録できない" do
        @item.price = "abcdef"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格が¥300未満では登録できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "販売価格が¥9,999,999以上では登録できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end



    end
  end
end


