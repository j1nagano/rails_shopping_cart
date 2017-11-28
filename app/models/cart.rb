class Cart < ApplicationRecord
  has_many :cart_items

  def subtotal
    ret = 0
    self.cart_items.each do |cart_item|
      ret += cart_item.quantity * cart_item.item.price
    end
    return ret
  end

  def shipping_fee
    sum_of_quantity = self.cart_items.reduce(0){ |sum, cart_item| sum + cart_item.quantity }
    ((sum_of_quantity / 5).floor + 1) * 600
  end

  def cash_on_delivery_fee
    st = subtotal
    if st < 10000
      return 300
    elsif st < 30000
      return 400
    elsif st < 100000
      return 600
    else
      return 1000
    end
  end

  def tax
    ((subtotal + shipping_fee + cash_on_delivery_fee) * 0.08).floor
  end

  def total
    subtotal + shipping_fee + cash_on_delivery_fee + tax
  end

end
