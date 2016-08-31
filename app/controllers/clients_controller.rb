class ClientsController < ApplicationController
  def create
    @order = current_order
    @client = Client.create(client_params)
    @order.update(client_id: @client.id)
  end

  def search
    @client = Client.search(params[:search])
    @order = current_order
    if @client.new_record?
      @client.cif_dni = params[:search]
    else
      @order.update(client_id: @client.id)
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
