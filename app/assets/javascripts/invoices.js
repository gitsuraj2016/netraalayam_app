function update_subtotal() {
	var subtotal = 0;
	$('.price').each(function(i){
		var price = $(this).html();
		if (!isNaN(price)) subtotal += Number(price);
	});

	subtotal = subtotal.toFixed(2);
	$('#subtotal').html(subtotal);

	update_balance();
	// update_balance_discount();
}

function update_balance() {
	var total = Number($('#subtotal').html()) + Number($('#9').val());
	total = total.toFixed(2);

	$('.totalamount').html(total);
}
function update_balance_discount() {
	var tax = $("#9").val()
	if(tax == ''){
		var total = Number($('#subtotal').html()) - Number($('#99').val());
	}
	else{
		var total = (Number($('#subtotal').html()) + Number($('#9').val()))  -   Number($('#99').val());
	}
	total = total.toFixed(2);

	$('.totalamount').html(total);

}
function update_balance_advance() {
	var total = Number($('#invoice_total').html()) - Number($('#89').val());
	total = total.toFixed(2);
	$('#balance_amt').val(total);
}

function update_price() {
	var row = $(this).parents('.item-row');
	var price = row.find('.cost').val() * row.find('.qty').val();
	price = price.toFixed(2);
	isNaN(price) ? row.find('.price').html('NaN') : row.find('.price').html(price);
	update_subtotal();
}
function bind1() {
	$('.cost').blur(update_price);
	$('.qty').blur(update_price);
}

function bind(main, modal) {
	var n = main.val();
	modal.empty();
	modal.append(n);
}

function bind2(main, modal) {
	var n = main.text();
	modal.empty();
	modal.append(" " + n);
}

function openinvoice_modal(orderid){
       $.ajax({
            url: "/invoices/get_orderitemdata",
            method: "GET",  
            data: {orderid: orderid },
            error: function (xhr, status, error) {
              console.error('AJAX Error: ' + status + error);
            },
            success: function (data) {
            	$('#myModal').css('display','block')
           
              var headerdata = (new Date()).toString().split(' ').splice(1,3).join(' ');
              $(".invoice_header_date").text(headerdata)
              $("#customer_name").text(data.customer.name)
              $("#customer_id").text(data.customer.id)
              $("#customer_phone").text(data.customer.mobile)
              $("#customer_gmail").text(data.customer.email)
              $("#customer_gender").text(data.customer.gender)
              $("#customer_age").text(data.customer.age)
              $("#customer_address").text(data.customer.address)
              $("#customer_pro").text(data.customer.profession)
              $("#modal_invoice_number").text(data.order.id)
              var date = (new Date(data.order.delivery_date)).toString().split(' ').splice(1,3).join(' ');
              $("#delivery_date").text(date)
              $("table#modal_items").empty();
              var newRow = $("<thead>");
              var cols = ""
              cols += '<th class="item-name">Item</th><th class="description">Description</th><th class="unit">Unit Cost</th><th class="quantity">Quantity</th><th class="units">Price</th>'
               newRow.append(cols);
                $("table#modal_items").append(newRow);
              for (i = 0; i < data.orderitems.length; i++){
                var newRow = $("<tr class='item-rows'>");
                var cols = "";
                cols += '<td><span class="itemids" rel="'+data.orderitems[i].count+'" id="item_id'+ data.orderitems.count + '">'+data.orderitems[i].itemid+'</span></td>';
                cols += '<td><span readonly  id="product_des'+ data.orderitems[i].count + '">'+data.orderitems[i].productname+'</span></td>';
                cols += '<td><span class="itemcost" readonly id="item_cost'+ data.orderitems[i].count + '">'+data.orderitems[i].unitprice+'</span></td>';
                cols += '<td><span class="qty qualitys" qel="'+data.orderitems[i].count+'"  id="item_qty'+ data.orderitems[i].count + '">'+data.orderitems[i].quantity+'</spsn></td>';
                cols += '<td><span class="itemprices" readonly id="item_price'+ data.orderitems[i].count + '">'+data.orderitems[i].cosrprice+'</span></td>'
                newRow.append(cols);
                $("table#modal_items").append(newRow);
              }
              $("#modal_subtotal").text(data.order.subtotal)
              $("#modal_9").text(data.order.tax_amt)
              $("#modal_99").text(data.order.discount_amt)
              $("#totals_amount").text(data.order.total_amt)
              $("#modal_89").text(data.order.advance_amt)
              $("#modal_balance").text(data.order.balance_amount)
            }
          });
}

function closemodal(){
  $('#myModal').css('display' , 'none')      
}