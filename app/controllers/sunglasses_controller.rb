class SunglassesController < ApplicationController
  before_action :set_frame, only: [:show, :edit, :update, :destroy]

  # GET /frames
  # GET /frames.json
  def index
    @sunglasses = Sunglasse.all
  end

  # GET /frames/1
  # GET /frames/1.json
  def show
  end

  # GET /frames/new
  def new
    @sunglasse = Sunglasse.new
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
    @sunglasse = Sunglasse.new(sunglasse_params)

    respond_to do |format|
      if @sunglasse.save
        create_item_data(@sunglasse)
        format.html { redirect_to({:action => :index}, {:notice => 'Frame was successfully created.'}) }
        # format.html { redirect_to @frame, notice: 'Frame was successfully created.' }
        format.json { render :show, status: :created, location: @sunglasse }
      else
        format.html { render :new }
        format.json { render json: @sunglasse.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_item_data(sunglasse)
     item =  InventoryItem.new
     item.inventory_type = "sunglasse"
     item.sunglasse_id =  sunglasse.id
     item.quantity = sunglasse.quantity
     item.barcode_status = false
     item.store_id = sunglasse.store_id
     item.save
  end

  # PATCH/PUT /frames/1
  # PATCH/PUT /frames/1.json
  def update
    respond_to do |format|
      if @sunglasse.update(sunglasse_params)
        inventoryitem = InventoryItem.where(:sunglasse_id=>@sunglasse.id).last
        inventoryitem.update_attribute(:quantity, @sunglasse.quantity)
        format.html { redirect_to({:action => :index}, {:notice => 'Frame was successfully updated.'}) }
        # format.html { redirect_to @frame, notice: 'Frame was successfully updated.' }
        format.json { render :show, status: :ok, location: @sunglasse }
      else
        format.html { render :edit }
        format.json { render json: @sunglasse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frames/1
  # DELETE /frames/1.json
  def destroy
    inventoryitem = InventoryItem.where(:sunglasse_id=>@sunglasse.id).last
    inventoryitem.destroy
    @sunglasse.destroy
    respond_to do |format|
      format.html { redirect_to sunglasses_url, notice: 'Frame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frame
      @sunglasse = Sunglasse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sunglasse_params
      params.require(:sunglasse).permit(:product_name,:brand_name, :frame_type, :frame_shape, :model_no, :frame_size, :bridge_size, :temple_size, :eye_size, :frame_color, :glass_color, :weight, :frame_material, :temple_material, :collection, :lens_material, :gender, :height, :condition, :temple_color, :no_s, :MRP, :NRP, :discount, :store_id,:quantity, :product_id)
    end
end
