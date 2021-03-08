class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  with_options presence: true do
    validates :name
    validates :email, unique: false, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, length: { minimum: 7 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力してください' }
    validates :family_name_furi, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角（カタカナ）で入力してください' }
    validates :first_name_furi, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角（カタカナ）で入力してください' }
    validates :birthday
  end
end
