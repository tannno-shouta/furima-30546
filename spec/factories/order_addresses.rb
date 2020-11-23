FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postcode     { "123-1234"}
    area_id      { 2 }
    municipality { "大阪市北区" }
    address      { "1-2-3" }
    building     { "大阪ビル" }
    tel          { "08012345678" }
  end
end
