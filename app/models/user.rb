class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

    validates :nickname
    validates :password,format: { with:/\A[a-z0-9]+\z/i  }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角ひらがな、全角カタカナ、漢字で入力して下さい。'}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角ひらがな、全角カタカナ、漢字で入力して下さい。'}
  validates :first_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい。'}
  validates :last_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい。'}
  validates :birthday
 end
end