class MemberController < ApplicationController
  def index

  	@users = User.all
  end

  def create
  end

  def create_user

  	  @uu = User.new
  	  @uu.name = params[:abc][:name]
  	  @uu.email  = params[:abc][:email]
  	  @uu.password = params[:abc][:password]
  	  @uu.save!

    respond_to do |format|
      if @uu.save
        format.html { redirect_to({:action => :index}, {:notice => 'User was successfully created.'}) }
        # format.html { redirect_to @role, notice: 'Role was successfully created.' }
        # format.json { render :show, status: :created, location: @role }
      end
    end
  end

end
