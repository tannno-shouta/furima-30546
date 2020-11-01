FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { 'hogehoge@gmail.com' }
    password { '6978pannya' }
    password_confirmation    {"6978pannya"}
    first_name { '佐藤' }
    last_name { '太郎' }
    first_kana{ 'サトウ' }
    last_kana { 'タロウ' }
    birthday { '2000-01-01' }

  end
end
