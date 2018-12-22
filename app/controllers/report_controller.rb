class ReportController < ApplicationController
  def index
  	 @orders = Order.all
  end

  def show_order_data

    start_date = params[:sdate].to_date.beginning_of_day
    end_date = params[:edate].to_date.end_of_day
    @orders = Order.where(:created_at => start_date..end_date)

  	respond_to do |format|
       format.js { }
     end
  end

  def csv
  	  @order = Order.all
  	  respond_to do |format|
		  format.csv { send_data @order.to_csv, filename: "orders-#{Date.today}.csv" } 
	  end
  end

  def excel
  	  @orders = Order.all
      respond_to do |format|
		  format.csv { send_data @order.to_csv, filename: "orders-#{Date.today}.csv" } 
	  end
  	    
  end
end
