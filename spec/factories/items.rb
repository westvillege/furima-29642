FactoryBot.define do
  factory :item do
    product           { '商品' }
    description       { '説明' }
    price             { 1111 }
    category_id       { 2 }
    condition_id      { 2 }
    fee_id            { 2 }
    prefecture_id     { 2 }
    delivery_id       { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.png')
    end
  end
end
