class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :check_stock

  def check_stock
  	@components_descriptions = ComponentDesc.all
  	@alert_count = 0

  	@components_descriptions.each do |c|
  		@component_count = c.alert
  		@alert_count += 1 if c.components.count <= @component_count
  	end
  end
end
