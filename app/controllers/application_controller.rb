class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :check_stock

  def check_stock
  	components_descriptions = ComponentDesc.all
    @components_warnings = []

    components_descriptions.each do |c|
      @components_warnings.push(c) if c.components.count <= c.alert
  	end
  end
end
