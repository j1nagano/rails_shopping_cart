class HomeController < ApplicationController
  def index
    p params
    @items = Item.all.order(:display_order)
  end

  private
  def home_params
    params.require(:customer).permit(:mail, :address, :password)
  end
end
