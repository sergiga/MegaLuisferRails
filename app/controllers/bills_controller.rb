class BillsController < ApplicationController
  def create
    @client = Client.find(params.delete :client_id)
    @bill = @client.bills.new(bill_repair_params)
    @bill.save
  end

  private
  def bill_repair_params
    params.require(:bill).permit(
      :price,
      repairs_attributes: [:description]
    )
  end
end
