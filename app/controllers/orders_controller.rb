class OrdersController < ApplicationController
  def new
    @order = Order.new
    @repairs = []
  end

  def create
    @order.client = @client
    @order.repairs << @repairs
  end

  def search_client
    @client = Client.search(params[:search])
    @client.cif_dni = params[:search]
  end

  def create_client
    @client = Client.new(client_params)
  end

  def add_repair
    repair = Repair.new(repair_params)
    @repairs << repair unless repair.new_record?
  end

  private
  def client_params
    params.require(:client).permit(
      :cif_dni,
      :name,
      :address,
      :contact_phone
    )
  end

  def repair_params
    params.require(:repair).permit(:description)
  end
end
