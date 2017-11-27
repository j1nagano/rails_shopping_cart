class HomeController < ApplicationController
  def index
    @items = Item.all.order(:display_order)
  end

end
