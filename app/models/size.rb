class Size < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'XS size' },
    { id: 3, name: 'S size' },
    { id: 4, name: 'M size' },
    { id: 5, name: 'L size' },
    { id: 6, name: 'Xl size' },
    { id: 7, name: 'XXL size' }
  ]

  include ActiveHash::Associations
  has_many :items
end

