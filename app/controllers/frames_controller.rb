class FramesController < ApplicationController
  before_action :set_frame, only: [:show, :edit, :update, :destroy]

  # GET /frames
  # GET /frames.json
  def index
    @frames = Frame.all
  end

  # GET /frames/1
  # GET /frames/1.json
  def show
  end

  # GET /frames/new
  def new
    @frame = Frame.new
    @stores = Store.all
    @products = Product.all
  end

  # GET /frames/1/edit
  def edit
     @stores = Store.all
     @products = Product.all
  end

  # POST /frames
  # POST /frames.json
  def create
    @frame = Frame.new(frame_params)

    respond_to do |format|
      if @frame.save
        create_item_data(@frame)
        format.html { redirect_to({:action => :index}, {:notice => 'Frame was successfully created.'}) }
        # format.html { redirect_to @frame, notice: 'Frame was successfully created.' }
        format.json { render :show, status: :created, location: @frame }
      else
        format.html { render :new }
        format.json { render json: @frame.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_item_data(frame)
     item =  InventoryItem.new
     item.inventory_type = "frame"
     item.frame_id =  frame.id
     item.quantity = frame.quantity
     item.barcode_status = false
     item.store_id = frame.store_id
     item.save
  end

  # PATCH/PUT /frames/1
  # PATCH/PUT /frames/1.json
  def update
    respond_to do |format|
      if @frame.update(frame_params)
        format.html { redirect_to({:action => :index}, {:notice => 'Frame was successfully updated.'}) }
        # format.html { redirect_to @frame, notice: 'Frame was successfully updated.' }
        format.json { render :show, status: :ok, location: @frame }
      else
        format.html { render :edit }
        format.json { render json: @frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frames/1
  # DELETE /frames/1.json
  def destroy
    @frame.destroy
    respond_to do |format|
      format.html { redirect_to frames_url, notice: 'Frame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frame
      @frame = Frame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def frame_params
      params.require(:frame).permit(:product_name, :brand_name, :frame_type, :frame_shape, :model_no, :frame_size, :bridge_size, :temple_size, :eye_size, :frame_color, :glass_color, :weight, :frame_material, :temple_material, :collection, :lens_material, :gender, :height, :condition, :temple_color, :no_s, :MRP, :NRP, :discount, :store_id,:quantity, :product_id)
    end
end
