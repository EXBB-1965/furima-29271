FactoryBot.define do
  factory :order_address_form do
    postal_code {Faker::Base.numerify('###-####')}
    prefecture_id {2}
    city {Faker::Address.city}
    address {Faker::Address.city}
    phone_number {Faker::Base.numerify('###########')}
    token {Faker::Number.number}
  end
end
