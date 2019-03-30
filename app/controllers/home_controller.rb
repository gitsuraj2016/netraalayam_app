class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
     @items = 100
     @invet = 20
     @xyz = 30
     @abc = 40
     @storeid = 0;
     if current_user.role.name == "admin"
     	if session[:store_id].present?
     		@storeid = session[:store_id]
     	end
     	@custs = Store.all
     else
     	@custs = Store.where(:id=> current_user.store_id).all
     end
     
  end

  def store_storeid

  	  store_id = params[:store_id]
      session[:store_id] = store_id
  	  render :json => {:store_id => store_id }.to_json
  end

  
end
