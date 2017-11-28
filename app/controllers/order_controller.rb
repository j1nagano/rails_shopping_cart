class OrderController < ApplicationController
  def address_confirm
    #@cart_id = current_cart.id
    @customer_info = current_customer
    #@order = Order.new
    #@order.name = current_customer.name
    #@order.address = current_customer.address
  end

  def create
    p current_cart
    p current_customer
    p order_params
    Order.create_order_from_cart( current_customer.id, order_params, current_cart )
    # "name"=>"aaa", "address"=>"埼玉県戸田市〇〇町１－２－4"
  end

  def address_change
  end

  def show
  end

  private

    def order_params
      params.permit( :name, :address )
    end
end
