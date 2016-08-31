class OrdersController < ApplicationController
  def new
    session.delete(:order_id)
    @order = Order.new
    @order.save
    session[:order_id] = @order.id
  end

  def create
    @order = current_order
    if @order.valid?(:account_setup)
      @order.update_attributes(order_params)
      session.delete(:order_id)
    end
  end

  private
  def order_params
    params.require(:order).permit(:price)
  end
end
