class ComponentDescsController < ApplicationController

	def index
		@component_descs = ComponentDesc.all
	end

	def new
		@component_desc = ComponentDesc.new
	end

	def create
		@component_desc = ComponentDesc.new(component_params)
		if @component_desc.save
			redirect_to component_descs_path
		else
			render 'new'
		end
	end

	def edit
		@component_desc = ComponentDesc.find(params[:id])
	end

	def update
		@component_desc = ComponentDesc.find(params[:id])
		if @component_desc.update_attributes(component_params)
			redirect_to component_descs_path
		else
			render 'edit'
		end
	end

	def destroy
		ComponentDesc.find(params[:id]).destroy
		redirect_to component_descs_path
	end

	private
	def component_params
		params.require(:component_desc).permit(:componentType, :brand, :model, :features, :alert)
	end
end
