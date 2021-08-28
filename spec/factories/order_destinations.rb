FactoryBot.define do
  factory :order_destination do
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    ad_detail { '1-1' }
    building { '' }
    phone { '11111111111' }
    token { 'token' }  
  end
end