class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
     @items = 100
     @invet = 20
     @xyz = 30
     @abc = 40
     @custs = Store.where(:id=> current_user.store_id).all
  end

  
end
