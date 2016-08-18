class ClientsController < ApplicationController
  def create
    @client = Client.create(client_repair_params)
    redirect_to home_path
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
