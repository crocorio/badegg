class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :size 
  

  belongs_to :user

  has_one_attached :image

validates :name, presence: true
validates :description, presence: true
validates :size_id, presence: true
validates :shipping_cost, presence: true
validates :prefecture_id, presence: true
validates :shipping_date_id, presence: true
validates :price, presence: true
validates :image, presence: true

validates :size_id, numericality: { other_than: 1, message: "is blank" }

end
