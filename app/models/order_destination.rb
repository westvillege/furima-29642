class OrderDestination
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id, :city, :ad_detail, :building, :phone, :item_id, :user_id
  attr_accessor :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: '全角で入力してください' }
    validates :ad_detail, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: '全角で入力してください' }
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, prefecture: prefecture, city: city, ad_detail: ad_detail, building: building, phone: phone, order_id: order.id)
  end

end