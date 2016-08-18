class ComponentDescsController < ApplicationController

	def index
		@component_descs = ComponentDesc.all
	end
end
