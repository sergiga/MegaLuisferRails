class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  include SessionsHelper

  before_action :check_stock

  def current_order
    if session[:order_id].nil?
      Order.new
    else
      Order.find(session[:order_id])
    end
  end

  def check_stock
  	components_descriptions = ComponentDesc.all
    @components_warnings = []

    components_descriptions.each do |c|
      @components_warnings.push(c) if c.components.count <= c.alert
  	end
  end
end
