class RepairsController < ApplicationController
  def new
    @client = Client.new
  end

  def search_client
    @client = Client.search(params[:search])
    if @client.new_record?
      bill = @client.bills.build
      bill.repairs.build
      @client.cif_dni = params[:search]
    else
      @bill = Bill.new
      @bill.repairs.build
      params[:client_id] = @client.id
    end
    respond_to do |format|
      format.html { redirect_to home_path }
      format.js
    end
  end
end
