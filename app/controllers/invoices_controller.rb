class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show]

  # GET /invoices
  # GET /invoices.json
  def index
      
    @orders = Order.where(:store_id=>current_user.store_id)
    # @invoices = @search.result
  end

  def search
    index
    render :index
  end

    def edit
     @custs = Customer.all
     @invoice = Order.where(:id=>params[:id]).last
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    d = DateTime.now
    @curdate = d.strftime("%d/%m/%Y %H:%M")
    @prodct_type = Product.all
    @custs =  Customer.where(:store_id => current_user.store_id).all
    puts ">>>>>>>>>>>>#{@custs.inspect}"
    # @custs = Customer.where(:store_id => current_user.store_id).all
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_item_product
    inverntory_item = InventoryItem.where(:id=> params[:id] ).first
    product_desc = ''
    unit_price = ''
    if inverntory_item
      if inverntory_item.inventory_type == "frame"
        product_desc = inverntory_item.frame.product.description
        unit_price = inverntory_item.frame.MRP.to_f
        remainqty = inverntory_item.quantity
      elsif inverntory_item.inventory_type == "lense"
        product_desc = inverntory_item.len.product.description
        unit_price = inverntory_item.len.MRP.to_f
      elsif inverntory_item.inventory_type == "sunglasse"
        product_desc = inverntory_item.sunglasse.product.description
        unit_price = inverntory_item.sunglasse.MRP.to_f
      end
    else  
    @erorMsg = "Customer Not Found."  
    end
    render :json => {:product_desc => product_desc, :unit_price=> unit_price}.to_json
  end

  def get_cust_data

    cust = Customer.where(:id=> params[:custid]).first
    
    if cust
      @cid = cust.id
      @cname = cust.name
      @cadd = cust.address
      @cprofess = cust.profession
      @cemail = cust.email
      @cmobile = cust.mobile
       if cust.gender == "1"
          @cgen = "Male"
        elsif cust.gender == "2"
          @cgen = "Female"
        elsif cust.gender == "3"
          @cgen = "Kid"
        end
     else
      @erorMsg = "Customer Not Found."
    end 

    respond_to do |format|
       format.js { }
     end
       
  end
  def generate_cust_invoice
       custid =  params[:custid]
       itemArr = params[:item_arr]
       subtotal = params[:subtotal]
       input_tax  = params[:input_tax]
       input_discount  = params[:input_discount]
       invoice_total  = params[:invoice_total]
       input_advance = params[:input_advance]
       balance = params[:balance]
      if custid.present?
         nord = Order.new 
         nord.delivery_date = 10.days.from_now.to_s
         nord.subtotal  = subtotal
         nord.tax_amt  = input_tax
         nord.discount_amt  = input_discount
         nord.total_amt  = invoice_total
         nord.advance_amt = input_advance
         nord.payment_mode = "Cash"
         nord.customer_id = custid
         nord.balance_amount = balance
         nord.store_id = current_user.store_id
         nord.save
         if nord.present?
            itemArr.each do |item|
              or_de = OrderDetail.new
              or_de.item_id = item[1][:itemid]
              or_de.quantity = item[1][:qty]
              or_de.price  = item[1][:cost]
              or_de.order_id = nord.id
              or_de.save
              update_procust(item[1][:itemid],item[1][:qty])
           end
         end
      end
      render :json => {status: "success"}.to_json
  end

  def update_procust(pid, p_qnt)
      frm = InventoryItem.where(:id => pid).first
      if frm.present?
          fc_qny = frm.quantity
          frm.quantity = fc_qny.to_i - p_qnt.to_i
          frm.save
      end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:amount, :company, :contragent, :currency, :date)
    end
end
