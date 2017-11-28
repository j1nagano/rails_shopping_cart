class OrderController < ApplicationController
  def address_confirm
    @customer_info = current_customer
  end

  def create
    order = Order.create_order_from_cart( current_customer.id, order_params, current_cart )
    if order.nil?
      redirect_to address_confirm_order_index_path, :notice => "注文の作成に失敗しました。入力に間違いがないかご確認ください。"
    else
      flash[:notice] = 'ご注文ありがとうございます。'
      render :action => 'index'
      return
    end
  end

  def index
    @orders = Order.where( :customer_id => current_customer.id ).order("created_at desc")
    @orders = [] if @orders.nil?
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
