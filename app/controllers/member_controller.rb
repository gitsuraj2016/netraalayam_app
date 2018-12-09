class MemberController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role
  def index

  	@users = User.all

    puts ">>>>>>>>#{current_user.role.name}"
    puts ">>>>>>>>#{current_user.store.name}"
  end

  def create
     @roles = Role.where.not(name: "admin")
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
       end
    end
  end

  private

  def check_role
      if current_user.role.name != "admin"
         sign_out current_user
         redirect_to new_user_session_path, :notice => 'Sorry need Admin Permission'
      end 
  end

end
