require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end


      it "nicknameがない場合は登録できないこと" do 
        @user.nickname =nil
        @user.valid? 
        expect(@user.errors.full_messages).to include("Nickname can't be blank") 
      end

      it "emailがない場合は登録できないこと" do
        @user.email =nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordがない場合は登録できないこと" do
        @user.password =nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "encrypted_passwordがない場合は登録できないこと" do
        @user.password =nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "first_nameがない場合は登録できないこと" do
        @user.first_name =nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角ひらがな、全角カタカナ、漢字で入力して下さい。")
      end

      it "last_nameがない場合は登録できないこと" do
        @user.last_name =nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角ひらがな、全角カタカナ、漢字で入力して下さい。")
      end

      it "first_kanaがない場合は登録できないこと" do
        @user.first_kana =nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana は全角カタカナで入力して下さい。")
      end

      it "last_kanaがない場合は登録できないこと" do
        @user.last_kana =nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana 全角カタカナで入力して下さい。")
      end

      it "birthdayがない場合は登録できないこと" do
        @user.birthday =nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

        it "passwordが6文字以上であれば登録できること" do
          @user.password = "hoge1234"
          @user.password_confirmation = "hoge1234"
          expect(@user).to be_valid
        end
    
        it "passwordが5文字以下であれば登録できないこと" do
          @user.password = "12345"
          @user.password_confirmation = "12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        
        it "passwordが半角数字のみであれば登録できないこと" do
          @user.password = "123456"
          @user.password_confirmation = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it "passwordが半角英字のみであれば登録できないこと" do
          @user.password = "abcdef"
          @user.password_confirmation = "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it "passwordとpassword_confirmationが不一致では登録できないこと" do
          @user.password = "123456"
          @user.password_confirmation = "1234567"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "重複したemailが存在する場合登録できないこと" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it "passwordが存在してもencrypted_passwordがない場合は登録できないこと" do
          @user.password = "6978pannya"
          @user.password_confirmation =""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "first_nameが全角入力でなければ登録できないこと" do
          @user.first_name = "ｱｲｳｴｵ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name は全角ひらがな、全角カタカナ、漢字で入力して下さい。")
        end
  
        it "last_nameが全角入力でなければ登録できないこと" do
          @user.last_name = "ｱｲｳｴｵ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name は全角ひらがな、全角カタカナ、漢字で入力して下さい。")
        end

        it "first_kanaが全角カタカナでなければ登録できないこと" do
          @user.first_kana = "あいうえお"
          @user.valid?
          expect(@user.errors.full_messages).to include("First kana は全角カタカナで入力して下さい。")
        end
  
        it "last_kanaが全角カタカナでなければ登録できないこと" do
          @user.last_kana = "あいうえお"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last kana 全角カタカナで入力して下さい。")
        end

        it "emailは、@がなければ登録できないこと" do
          @user.email = "test.test.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
      
  end
end
