class ProductsController < ApplicationController

  respond_to :xml, :html

  before_action :check_connection

  def index
    @products = VersacommerceAPI::Product.all
    respond_to do |format|
      format.xml { render :xml => Product.to_xml(@products) }
      format.html
    end
  end

  private

  def check_connection
    VersaConnection.check_connection
  end

end
