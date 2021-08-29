class OrderDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :ad_detail, :building, :phone, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :ad_detail
    validates :phone, format: { with: /\A\d{10,11}\z/ }
    validates :prefecture, numericality: { other_than: 1 , message: "can't be blank"}  
    validates :token
  end

  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, prefecture: prefecture, city: city, ad_detail: ad_detail, building: building, phone: phone, order_id: order.id)
  end
end