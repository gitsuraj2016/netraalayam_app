class LensController < ApplicationController
  before_action :set_len, only: [:show, :edit, :update, :destroy]

  # GET /lens
  # GET /lens.json
  def index
    if current_user.role.name == "admin"
      @lens = Len.all
    else
      @lens = Len.where(:store_id=>current_user.store_id)
    end
    
  end

  # GET /lens/1
  # GET /lens/1.json
  def show
  end

  # GET /lens/new
  def new
    @len = Len.new
    @stores = Store.all
    @products = Product.all
  end

  # GET /lens/1/edit
  def edit
    @stores = Store.all
    @products = Product.all
  end

  # POST /lens
  # POST /lens.json
  def create
    @len = Len.new(len_params)
    respond_to do |format|
      if @len.save
        create_item_data(@len)
        format.html { redirect_to({:action => :index}, {:notice => 'Lens was successfully created.'}) }
        # format.html { redirect_to @len, notice: 'Len was successfully created.' }
        format.json { render :show, status: :created, location: @len }
      else
        format.html { render :new }
        format.json { render json: @len.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_item_data(lens)
     item =  InventoryItem.new
     item.inventory_type = "lense"
     item.len_id =  lens.id
     item.quantity = lens.quantity
     item.barcode_status = false
     item.store_id = lens.store_id
     item.save
  end

  # PATCH/PUT /lens/1
  # PATCH/PUT /lens/1.json
  def update
    respond_to do |format|
      if @len.update(len_params)
        inventoryitem = InventoryItem.where(:len_id=>@len.id).last
        inventoryitem.update_attribute(:quantity, @len.quantity)
        format.html { redirect_to({:action => :index}, {:notice => 'Lens was successfully updated.'}) }
        # format.html { redirect_to @len, notice: 'Len was successfully updated.' }
        format.json { render :show, status: :ok, location: @len }
      else
        format.html { render :edit }
        format.json { render json: @len.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lens/1
  # DELETE /lens/1.json
  def destroy
    inventoryitem = InventoryItem.where(:len_id=>@len.id).last
    inventoryitem.destroy
    @len.destroy
    respond_to do |format|
      format.html { redirect_to lens_url, notice: 'Len was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_len
      @len = Len.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def len_params
      params.require(:len).permit(:product_name,:product_id,:brand_name, :lens_type, :coatings1, :coatings2, :coatings3, :coatings4, :coatings5, :material, :power_range, :no_s, :MRP, :NRP, :discount, :quantity, :store_id)
    end
end
