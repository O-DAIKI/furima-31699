class AddressOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :phone_num, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality
    validates :address
    validates :phone_num, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_num: phone_num, order_id: order.id)
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end
