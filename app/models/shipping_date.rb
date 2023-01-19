class ShippingDate < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'Ship within 1~2 days' },
    { id: 3, name: 'Ship within 2~3 days' },
    { id: 4, name: 'Ship within 4~7 days' }
  ]

  include ActiveHash::Associations
  has_many :items
end