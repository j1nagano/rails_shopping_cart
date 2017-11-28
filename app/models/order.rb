class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  def self.create_order_from_cart customer_id, order_params, cart
    order = self.new
    order.customer_id  = customer_id
    order.subtotal     = cart.subtotal
    order.total        = cart.total
    order.tax          = cart.tax
    order.shipping_fee = cart.shipping_fee
    order.cash_on_delivery_fee = cart.cash_on_delivery_fee
    order.name         = order_params[:name]
    order.address      = order_params[:adress]

    if order.save
      cart.cart_items.each do |cart_item|
        order_item = OrderItem.create_from_cart_item order.id, cart_item
        if order_item.nil?
          order.destroy
          return nil
        end
      end
      return order
    else
      return nil
    end
  end
end
