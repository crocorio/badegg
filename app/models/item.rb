class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_cost
  belongs_to :shipping_date
  

  belongs_to :user

  has_one_attached :image

validates :name, presence: true
validates :description, presence: true

validates :shipping_cost_id, presence: true

validates :shipping_date_id, presence: true
validates :price, presence: true
validates :image, presence: true



end
