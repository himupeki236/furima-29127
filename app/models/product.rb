class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order_user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :ship_charge
  belongs_to :ship_day
  belongs_to :state

  #空の投稿を保存できないようにする
  #ジャンルの選択が「--」の時は保存できないようにする
  with_options presence: true do
    validates :image
    validates :name
    validates :describe
    validates :price
    with_options numericality: { other_than: 1 }  do
      validates :category_id
      validates :state_id
      validates :ship_charge_id
      validates :prefecture_id
      validates :ship_day_id
    end
  end

  validates :name, length: { maximum: 40 }
  validates :describe, length: { maximum: 1000 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }



end
