class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def self.create_from_cart_item order_id, cart_item
    order_item = self.new
    order_item.quantity = cart_item.quantity
    order_item.price    = cart_item.item.price
    order_item.item_id  = cart_item.item_id
    order_item.order_id = order_id
    order_item.save
    return order_item
  end
end
