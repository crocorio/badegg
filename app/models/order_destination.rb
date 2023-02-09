class OrderDestination
  include ActiveModel::Model
  attr_accessor  :item_id, :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :size_id, :email, :name, :order_id, :token

  with_options presence: true do
    
    validates :item_id

    validates :city
    validates :block
    validates :email
    validates :name 

    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is not valid' }

    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is not valid. Please enter it as follows (example 123-4567)' }

    validates :token
  end 

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :size_id, numericality: { other_than: 1, message: "can't be blank" }

  validate :building

  def save
    order = Order.create( item_id: item_id)

    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building,
                       phone_number: phone_number, email: email, size_id: size_id, name: name, order_id: order.id)
  end

end 