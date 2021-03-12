class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_many :conditions
  has_many :fees
  has_many :prefectures
  has_many :delivery

  has_one_attached :image

  with_options presence: true do
    validates :product, length:{maximum:40}
    validates :description, length:{maximum:1000}
    validates :price, inclusion: { in: 300..9_999_999 }, format:{ with: /\A[0-9]+\z/ }
    validates :user
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 } 
    validates :fee_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :delivery_id, numericality: { other_than: 1 } 
  end

end
