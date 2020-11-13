FactoryBot.define do
  factory :item do
    product { "airpods pro"}
    message { "appleの正規品"}
    category_id { 2 }
    status_id   { 2 }
    shipping_id { 2 }
    area_id     { 2 }
    day_id     { 2 }
    price  { 20000 }
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
