require 'barby'
require 'barby/barcode/ean_13'
require 'barby/barcode/code_128'
# require 'barby/outputter/ascii_outputter'
require 'barby/outputter/html_outputter'
require 'chunky_png'
require 'barby/outputter/png_outputter'


class InventoryController < ApplicationController
  def index
  	   @frame = Frame.where(:store_id=>current_user.store_id)
  	   @len = Len.where(:store_id=>current_user.store_id)
       @sunglasse = Sunglasse.where(:store_id=>current_user.store_id)
  end

  def barcode_generate
  	  @frames = InventoryItem.where(:inventory_type => 'frame', :store_id => current_user.store_id, :barcode_status => false).all
      @lens = InventoryItem.where(:inventory_type => 'lense', :store_id => current_user.store_id, :barcode_status => false).all
      @sunglasse = InventoryItem.where(:inventory_type => 'sunglasse', :store_id => current_user.store_id, :barcode_status => false).all
      @barcode_for_html = '';
  	  # @barcode = Barby::Code128B.new('000000000000')
     #  @barcode_for_html = Barby::HtmlOutputter.new(@barcode)
      # bbcode
  end
  def get_frame_data
    
    inventory_item = InventoryItem.where(:id=> params[:frameid]).first
     if(params[:inverory_type] == "frame")
     @frame = inventory_item.frame
    elsif (params[:inverory_type] == "lense")
      @frame = inventory_item.len
    elsif (params[:inverory_type] == "sunglasse")
     @frame = inventory_item.sunglasse
   end
     @fid = @frame.id
     @fname = @frame.product.name
     @product_name = @frame.product_name
     @quantity = @frame.quantity
     @mrp = @frame.MRP     
     respond_to do |format|
       format.js { }
     end
  end
  def generate_barcode
      @pid = params[:BarCode][:inverory_id]
      @pname  = params[:BarCode][:product_name]
      @prate = params[:BarCode][:prate]
      @pqt = params[:BarCode][:quantity] 
      inventory_item = InventoryItem.where(:id=> @pid ).first
      @produc_name =
      @barcode = Barby::Code128B.new(@pid)
      @barcode_for_html = Barby::HtmlOutputter.new(@barcode)
      inventory_item.update_attribute(:barcode_status, true)

     respond_to do |format|  
            format.js
     end 
  end

  def bbcode
  	   if File.directory?("#{Rails.root}/public/barcodes") == false
	      system 'mkdir', '-p', "#{Rails.root}/public/barcodes"
	   end

	  [1,2,3,4,5,6].each do |barcode_number|
	    @barcode = Barby::Code128B.new(barcode_number)
	    @blob = Barby::PngOutputter.new(@barcode).to_png
	    File.open("#{Rails.root}/public/barcodes/#{barcode_number}.png", 'wb'){ |f|
	      f.write @blob
	    }

      end
   end
end
