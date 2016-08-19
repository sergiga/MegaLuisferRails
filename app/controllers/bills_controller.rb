class BillsController < ApplicationController
  def create
    @client = Client.find(params.delete :client_id)
    @bill = @client.bills.new(bill_repair_params)
    if @bill.save
      redirect_to home_path
    else
      render 'repairs/new'
    end
  end

  private
  def bill_repair_params
    params.require(:bill).permit(
      :price,
      repairs_attributes: [:description]
    )
  end
end
