class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :delivery

  has_one_attached :image

  with_options presence: true do
    validates :product, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :delivery_id
  end
end
