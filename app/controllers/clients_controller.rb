class ClientsController < ApplicationController
  def search
    @client = Client.find_by(cif_dni: params[:search]) || Client.new
    respond_to do |format|
      format.html { redirect_to home_path }
      format.js
    end
  end
end
