class Address < ApplicationRecord
  belongs_to :order_user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
