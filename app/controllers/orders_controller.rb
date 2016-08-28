class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order.client = @client
    @order.repairs << @repairs
  end

  def add_repair
    repair = Repair.new(repair_params)
    @repairs << repair unless repair.new_record?
  end

  def repair_params
    params.require(:repair).permit(:description)
  end
end
