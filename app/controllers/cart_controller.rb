class CartController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item]

  def show
    @cart = current_cart
    @cart_items = @cart.cart_items
    @cart_items = [] if @cart_items.nil?
  end

  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(item_id: params[:item_id])
    end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to current_cart
  end

  def update_item
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  private
  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end
end

