class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
     @items = 100
     @invet = 20
     @xyz = 30
     @abc = 40
  end

  # def create_user
  # 	  puts ">>>>>>>>>>#{params[:abc][:name]}"
  # 	  puts ">>>>>>>>>>#{params[:abc][:password]}"
  # 	  uu = User.new
  # 	  uu.name = params[:abc][:name]
  # 	  uu.email  = "abc@gmail.com"
  # 	  uu.password = params[:abc][:password]
  # 	  uu.save!
  # 	  # User.create([{ name: 'lalit', email: 'lalit@gmail.com', password: "11111111", remember_created_at: nil }])

  # 	  redirect_to :root 
  # end
end
