FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    price { Faker::Number.within(range: 300..9_999_999) }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.within(range: 1..12) }
    color_id { Faker::Number.within(range: 1..16) }
    material_id { Faker::Number.within(range: 1..12) }
    size_id { Faker::Number.within(range: 1..3) }
    delivery_charge_id { Faker::Number.within(range: 1..2) }
    prefecture_id { Faker::Number.within(range: 1..47) }
    shipping_day_id { Faker::Number.within(range: 1..3) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
