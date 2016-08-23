class ClientsController < ApplicationController
  def create
    @client = Client.new(client_repair_params)
    @client.save
  end

  private
  def client_repair_params
    params.require(:client).permit(
      :cif_dni,
      :name,
      :address,
      :contact_phone,
      bills_attributes: [:price, repairs_attributes: [:description]]
    )
  end
end
