class RepairsController < ApplicationController
  def new
    @repair = Repair.new
  end

  def create
    @order = current_order
    @repair = Repair.new(repair_params)
    @repair.order = @order
    @repair.save
  end

  def edit
    @repair = Repair.find(params[:id])
  end

  def update
    @repair = Repair.find(params[:id])
    @repair.update_attributes(repair_params)
  end

  def destroy
    @repair = Repair.find(params[:id])
    @repair.destroy
  end

  private
  def repair_params
    params.require(:repair).permit(:description)
  end
end
