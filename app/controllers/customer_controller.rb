class CustomerController < ApplicationController
  def index

  	@custs =  Customer.all

  end

  def create
  end

  def create_customer

     
	  cust = Customer.new
	  cust.name  = params[:customer][:name]
	  cust.address = params[:customer][:address]
	  cust.profession = params[:customer][:profession]
	  cust.email = params[:customer][:email]
	  cust.mobile = params[:customer][:mobile]
	  cust.gender = params[:customer][:gender]
	  # cust.age = params[:customer][:name]
	  cust.dob = params[:customer][:dob]
	  cust.anniversary_date = params[:customer][:anniversary_date]
	  cust.major_complaint = params[:customer][:major_complaint]
	  cust.ocular_history = params[:customer][:ocular_history]
	  cust.medical_history = params[:customer][:medical_history]
	  cust.current_medication = params[:customer][:current_medication]
	  cust.entered_by = current_user.id
	  cust.store_id = current_user.store_id
      cust.save

    if cust.present?
        # "old_rgt_cyl_1"=>"", 
	   # "old_rgt_axix_1"=>"",
	    if params[:customer][:old_rgt_sph_1] || params[:customer][:old_rgt_cyl_1] || params[:customer][:old_rgt_axix_1]
	      pres = PrescriptionSpectacle.new
		  pres.eye_type = "rgt"
		  pres.pres_type = "old"
		  pres.row_no = 1
		  pres.customer_id = cust.id
		  pres.sph  = params[:customer][:old_rgt_sph_1]
		  pres.cyl  = params[:customer][:old_rgt_cyl_1]
		  pres.axis = params[:customer][:old_rgt_axix_1]
		  pres.save
	    end 
	    # "old_rgt_sph_2"=>"", 
	    # "old_rgt_cyl_2"=>"", 
	    # "old_rgt_axix_2"=>"",
       if params[:customer][:old_rgt_sph_2] || params[:customer][:old_rgt_cyl_2] || params[:customer][:old_rgt_axix_2]
	      pres = PrescriptionSpectacle.new
		  pres.eye_type = "rgt"
		  pres.pres_type = "old"
		  pres.row_no = 2
		  pres.customer_id = cust.id
		  pres.sph  = params[:customer][:old_rgt_sph_2]
		  pres.cyl  = params[:customer][:old_rgt_cyl_2]
		  pres.axis = params[:customer][:old_rgt_axix_2]
		  pres.save
	    end 
	   #  "old_lft_sph_1"=>"", 
	   # "old_lft_cyl_1"=>"", 
	   # "old_lft_axix_1"=>"",
	   if params[:customer][:old_lft_sph_1] || params[:customer][:old_lft_cyl_1] || params[:customer][:old_lft_axix_1]
	      pres = PrescriptionSpectacle.new
		  pres.eye_type = "lft"
		  pres.pres_type = "old"
		  pres.row_no = 1
		  pres.customer_id = cust.id
		  pres.sph  = params[:customer][:old_lft_sph_1]
		  pres.cyl  = params[:customer][:old_lft_cyl_1]
		  pres.axis = params[:customer][:old_lft_axix_1]
		  pres.save
	    end 

	   #  "old_lft_sph_2"=>"", 
	   # "old_lft_cyl_2"=>"", 
	   # "old_lft_axix_2"=>"",
	   if params[:customer][:old_lft_sph_2] || params[:customer][:old_lft_cyl_2] || params[:customer][:old_lft_axix_2]
	      pres = PrescriptionSpectacle.new
		  pres.eye_type = "lft"
		  pres.pres_type = "old"
		  pres.row_no = 2
		  pres.customer_id = cust.id
		  pres.sph  = params[:customer][:old_lft_sph_2]
		  pres.cyl  = params[:customer][:old_lft_cyl_2]
		  pres.axis = params[:customer][:old_lft_axix_2]
		  pres.save
	    end

	   # "new_rgt_sph_1"=>"", 
	   # "new_rgt_cyl_1"=>"", 
	   # "new_rgt_axix_1"=>"",
	   if params[:customer][:new_rgt_sph_1] || params[:customer][:new_rgt_cyl_1] || params[:customer][:new_rgt_axix_1]
	      pres = PrescriptionSpectacle.new
		  pres.eye_type = "rgt"
		  pres.pres_type = "new"
		  pres.row_no = 1
		  pres.customer_id = cust.id
		  pres.sph  = params[:customer][:new_rgt_sph_1]
		  pres.cyl  = params[:customer][:new_rgt_cyl_1]
		  pres.axis = params[:customer][:new_rgt_axix_1]
		  pres.save
	    end

	   # "new_rgt_sph_2"=>"", 
	   # "new_rgt_cyl_2"=>"", 
	   # "new_rgt_axix_2"=>"",
	   if params[:customer][:new_rgt_sph_2] || params[:customer][:new_rgt_cyl_2] || params[:customer][:new_rgt_axix_2]
	      pres = PrescriptionSpectacle.new
		  pres.eye_type = "rgt"
		  pres.pres_type = "new"
		  pres.row_no = 2
		  pres.customer_id = cust.id
		  pres.sph  = params[:customer][:new_rgt_sph_2]
		  pres.cyl  = params[:customer][:new_rgt_cyl_2]
		  pres.axis = params[:customer][:new_rgt_axix_2]
		  pres.save
	    end

	   # "new_lft_sph_1"=>"", 
	   # "new_lft_cyl_1"=>"", 
	   # "new_lft_axix_1"=>"",
	   if params[:customer][:new_lft_sph_1] || params[:customer][:new_lft_cyl_1] || params[:customer][:new_lft_axix_1]
	      pres = PrescriptionSpectacle.new
		  pres.eye_type = "lft"
		  pres.pres_type = "new"
		  pres.row_no = 1
		  pres.customer_id = cust.id
		  pres.sph  = params[:customer][:new_lft_sph_1]
		  pres.cyl  = params[:customer][:new_lft_cyl_1]
		  pres.axis = params[:customer][:new_lft_axix_1]
		  pres.save
	    end

	   # "new_lft_sph_2"=>"", 
	   # "new_lft_cyl_2"=>"", 
	   # "new_lft_axix_2"=>""
	   if params[:customer][:new_lft_sph_2] || params[:customer][:new_lft_cyl_2] || params[:customer][:new_lft_axix_2]
	      pres = PrescriptionSpectacle.new
		  pres.eye_type = "lft"
		  pres.pres_type = "new"
		  pres.row_no = 2
		  pres.customer_id = cust.id
		  pres.sph  = params[:customer][:new_lft_sph_2]
		  pres.cyl  = params[:customer][:new_lft_cyl_2]
		  pres.axis = params[:customer][:new_lft_axix_2]
		  pres.save
	    end
	end

	# if cust.present?
	# 	  pd = ProgressiveDetail.new
	# 	  pd.repd = params[:customer][:new_lft_sph_2]
 #          pd.lepd = params[:customer][:new_lft_sph_2]
 #          pd.befh = params[:customer][:new_lft_sph_2]
 #          pd.ed = params[:customer][:new_lft_sph_2]
 #          pd.customer_id = cust.id
 #          pd.save

	# end
	if cust.present?
		  pd = ProgressiveDetail.new
		  pd.repd = params[:customer][:re_pd]
          pd.lepd = params[:customer][:le_pd]
          pd.befh = params[:customer][:befh]
          pd.ed = params[:customer][:ed]
          pd.customer_id = cust.id
          pd.save

	end
	if cust.present?
		  recom = Recommendation.new
		  recom.frame_recom = params[:customer][:rec_frame]
          recom.lens_recom = params[:customer][:rec_lense]
          recom.coating_recom = params[:customer][:rec_coating]
          recom.csa_recom = params[:customer][:rec_csa]
          recom.sunrx_recom = params[:customer][:rec_sun_rx]
          
          recom.frame_fp = params[:customer][:fp_frame]
          recom.lens_fp = params[:customer][:fp_lense]
          recom.coating_fp = params[:customer][:fp_coating]
          recom.csa_fp = params[:customer][:fp_csa]
          recom.sunrx_fp = params[:customer][:fp_sun_rx]
          recom.customer_id = cust.id
          recom.save
      end
     if cust.present?
		  adinfo = AdditionalInfo.new
		  adinfo.optomentrist_note = params[:customer][:opt_note]
          adinfo.remark = params[:customer][:remark]
          adinfo.pid_frame = params[:customer][:pid_frame]
          adinfo.lense_type_a = params[:customer][:lense_tye1]
          adinfo.lense_type_b = params[:customer][:lense_tye2]
          
          adinfo.lense_type_c = params[:customer][:lense_tye3]
          adinfo.next_visit_date = params[:customer][:next_vist_date]
          adinfo.checked_by = params[:customer][:checked_by]
          adinfo.singature = params[:customer][:singature]
          adinfo.customer_id = cust.id
          adinfo.save
      end

    respond_to do |format|
      if cust.present? && pres.present?
         format.html { redirect_to({:action => :index}, {:notice => 'Customer was successfully created.'}) }
      end
    end

  end

end
