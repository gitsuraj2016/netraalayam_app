class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show]

  # GET /invoices
  # GET /invoices.json
  def index
    # @search = Invoice.search(params[:q])
    # @invoices = @search.result
  end

  def search
    index
    render :index
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
       itemid_1 = params[:item_id1]
       itemid_2 = params[:item_id2]
       itemid_3 = params[:item_id3]
       itemid_4 = params[:item_id4]
       item1_cost = params[:item1_cost]
       item2_cost = params[:item2_cost]
       item3_cost = params[:item3_cost]
       item4_cost =  params[:item4_cost]
       item1_qty =  params[:item1_qty]
       item2_qty =  params[:item2_qty]
       item3_qty =  params[:item3_qty]
       item4_qty =  params[:item4_qty]

       subtotal = params[:subtotal]
       input_tax  = params[:input_tax]
       input_discount  = params[:input_discount]
       invoice_total  = params[:invoice_total]
       input_advance = params[:input_advance]

       itemArr = [itemid_1,itemid_2,itemid_3,itemid_4]

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
         nord.store_id = current_user.store_id
         nord.save
         if nord.present?
            itemArr.each_with_index do  | inx,index |
                if inx.present?
                   or_de = OrderDetail.new
                   if index == 0
                    or_de.item_id = itemid_1
                    or_de.quantity = item1_qty
                    or_de.price  = item1_cost
                    update_procust(itemid_1,item1_qty)
                   elsif index == 1
                    or_de.item_id = itemid_2
                    or_de.quantity = item2_qty
                    or_de.price  = item2_cost
                    update_procust(itemid_2,item2_qty)
                   elsif index == 2
                    or_de.item_id = itemid_3
                    or_de.quantity = item3_qty
                    or_de.price  = item3_cost
                    update_procust(itemid_2,item2_qty)
                   elsif index == 3
                    or_de.item_id = itemid_4
                    or_de.quantity = item4_qty
                    or_de.price  = item4_cost
                    update_procust(itemid_4,item3_qty)
                   end
                   or_de.order_id = nord.id
                   or_de.save
                end
            end
         end
      end


      render :json => {status: "success"}.to_json

  end

  def update_procust(pid, p_qnt)

      frm = Frame.where(:id => pid).first
      if frm.present?
          fc_qny = frm.quantity
          frm.quantity = fc_qny.to_i - p_qnt.to_i
          frm.save
      end

      len = Len.where(:id => pid).first
      if len.present?
          fc_qny = len.quantity
          len.quantity = fc_qny - p_qnt
          len.save
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
