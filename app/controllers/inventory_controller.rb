require 'barby'
require 'barby/barcode/ean_13'
require 'barby/barcode/code_128'
# require 'barby/outputter/ascii_outputter'
require 'barby/outputter/html_outputter'
require 'chunky_png'
require 'barby/outputter/png_outputter'


class InventoryController < ApplicationController
  def index
  	   @frame = Frame.all
  	   @len = Len.all
       @sunglasse = Sunglasse.all
  end

  def barcode_generate

  	  @inventoryitems = InventoryItem.all
      @barcode_for_html = '';
  	  # @barcode = Barby::Code128B.new('000000000000')
     #  @barcode_for_html = Barby::HtmlOutputter.new(@barcode)
      # bbcode
  end
  def get_frame_data

     @frame = Frame.where(:id=> params[:frameid]).first
     @fid = @frame.id;
     @fname = @frame.product.name
     @quantity = @frame.quantity
     @mrp = @frame.MRP     
     respond_to do |format|
       format.js { }
     end
  end
  def generate_barcode

      
      @pid = params[:BarCode][:pid]
      @pname  = params[:BarCode][:pname]
      @prate = params[:BarCode][:prate]
      @pqt = params[:BarCode][:quantity]

      @barcode = Barby::Code128B.new(@pid)
      @barcode_for_html = Barby::HtmlOutputter.new(@barcode)

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
