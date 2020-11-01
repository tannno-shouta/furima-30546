class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

    zenkaku_hira_kana_kanji = /\A[ぁ-んァ-ン一-龥]/
    zenkaku_kana = /\A[ァ-ヶー－]+\z/

    validates :nickname
    validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?[0-9])[a-z0-9]+\z/i  }
     validates :first_name, format: {with: zenkaku_hira_kana_kanji , message: 'は全角ひらがな、全角カタカナ、漢字で入力して下さい。'}
     validates :last_name, format: {with: zenkaku_hira_kana_kanji , message: 'は全角ひらがな、全角カタカナ、漢字で入力して下さい。'}
    validates :first_kana, format: {with: zenkaku_kana , message: 'は全角カタカナで入力して下さい。'}
    validates :last_kana, format: {with: zenkaku_kana , message: '全角カタカナで入力して下さい。'}
    validates :birthday
 end
end