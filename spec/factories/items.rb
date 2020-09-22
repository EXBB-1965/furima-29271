FactoryBot.define do
  factory :item do
    id {1}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.png'))}
    name {"手"}
    discription {"手です"}
    category_id {2}
    status_id {2}
    payer_id {2}
    prefecture_id {2}
    shipping_day_id {2}
    price {300}
    created_at {Time.now}
    updated_at {Time.now}
    association :user
  end
end
