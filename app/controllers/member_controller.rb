class MemberController < ApplicationController
  before_action :authenticate_user!
  def index

  	@users = User.all
  end

  def create
     @roles = Role.all
     @stores = Store.all
  end

  def create_user

  	  @uu = User.new
  	  @uu.name = params[:abc][:name]
  	  @uu.email  = params[:abc][:email]
  	  @uu.password = params[:abc][:password]
      @uu.role_id = params[:abc][:role_id]
      @uu.store_id = params[:abc][:store_id]


    respond_to do |format|
      if @uu.save
        format.html { redirect_to({:action => :index}, {:notice => 'User was successfully created.'}) }
        # format.html { redirect_to @role, notice: 'Role was successfully created.' }
        # format.json { render :show, status: :created, location: @role }
      # end
    end
  end

end
