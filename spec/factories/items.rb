FactoryBot.define do
  factory :item do

    name {Faker::Lorem.sentence}
    discription {Faker::Lorem.sentences}
    category_id {Faker::Number.number(1..11)}
    status_id {Faker::Number.number(1..7)}
    payer_id {Faker::Number.number(1..3)}
    prefecture_id {Faker::Number.number(1..48)}
    shipping_day_id {Faker::Number.number(1..4)}
    price {Faker::Number.number(300..9999999)}

    association :user
  end
end
