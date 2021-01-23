class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :email
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i }
    validates :name_sei, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :name_mei, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :name_kana_sei, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :name_kana_mei, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_date
  end
  
end
