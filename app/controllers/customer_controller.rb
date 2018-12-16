class CustomerController < ApplicationController
  def index

  	@custs =  Customer.all
  end

  def create
  end

  def create_customer
  end

end
