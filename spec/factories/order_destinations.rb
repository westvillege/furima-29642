FactoryBot.define do
  factory :order_destination do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    ad_detail { '1-1' }
    building { '東京ハイツ' }
    phone { '09011111111' }
  end
end
