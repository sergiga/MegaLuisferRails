class ClientsController < ApplicationController
  def create
    @order = current_order
    @client = @order.client.new(client_params)
    @order.save
    session[:order_id] = @order.save
  end

  def search
    @client = Client.search(params[:search])
    @order = current_order
    if !@client.new_record?
      @order.client = @client
      @order.save
    end
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
end
