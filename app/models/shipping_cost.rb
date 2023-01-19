class ShippingCost < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'free shipping' },
    { id: 3, name: 'shipping fee included' }
  ]

  include ActiveHash::Associations
  has_many :items
end