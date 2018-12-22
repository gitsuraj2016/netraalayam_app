class CustomerController < ApplicationController
  def index

  	@custs =  Customer.where(:store_id => current_user.store_id).all

  end

  def create
  end

  def create_customer
   
        if params[:customer][:cid].present?
        	cid = params[:customer][:cid]
	      	cust = Customer.where(:id=> cid).first
	      	if cust.present?
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
		    end
		    pres_old = PrescriptionSpectacleOld.where(:customer_id => cust.id).first
            if pres_old.present?
          	  pres_old.customer_id = cust.id
			  pres_old.old_rgt_sph_1  = params[:customer][:old_rgt_sph_1]
			  pres_old.old_rgt_cyl_1  = params[:customer][:old_rgt_cyl_1]
			  pres_old.old_rgt_axix_1 = params[:customer][:old_rgt_axix_1]
			  pres_old.old_rgt_sph_2  = params[:customer][:old_rgt_sph_2]
			  pres_old.old_rgt_cyl_2  = params[:customer][:old_rgt_cyl_2]
			  pres_old.old_rgt_axix_2 = params[:customer][:old_rgt_axix_2]
			  pres_old.old_lft_sph_1  = params[:customer][:old_lft_sph_1]
			  pres_old.old_lft_cyl_1  = params[:customer][:old_lft_cyl_1]
			  pres_old.old_lft_axix_1 = params[:customer][:old_lft_axix_1]
			  pres_old.old_lft_sph_2  = params[:customer][:old_lft_sph_2]
			  pres_old.old_lft_cyl_2  = params[:customer][:old_lft_cyl_2]
			  pres_old.old_lft_axix_2 = params[:customer][:old_lft_axix_2]
			  pres_old.save
            end
            pres_new = PrescriptionSpectacleNew.where(:customer_id => cust.id).first
	        if pres_new.present?
          	  pres_new.customer_id = cust.id
			  pres_new.new_rgt_sph_1  = params[:customer][:new_rgt_sph_1]
			  pres_new.new_rgt_cyl_1  = params[:customer][:new_rgt_cyl_1]
			  pres_new.new_rgt_axix_1 = params[:customer][:new_rgt_axix_1]
			  pres_new.new_rgt_sph_2  = params[:customer][:new_rgt_sph_2]
			  pres_new.new_rgt_cyl_2  = params[:customer][:new_rgt_cyl_2]
			  pres_new.new_rgt_axix_2 = params[:customer][:new_rgt_axix_2]
			  pres_new.new_lft_sph_1  = params[:customer][:new_lft_sph_1]
			  pres_new.new_lft_cyl_1  = params[:customer][:new_lft_cyl_1]
			  pres_new.new_lft_axix_1 = params[:customer][:new_lft_axix_1]
			  pres_new.new_lft_sph_2  = params[:customer][:new_lft_sph_2]
			  pres_new.new_lft_cyl_2  = params[:customer][:new_lft_cyl_2]
			  pres_new.new_lft_axix_2 = params[:customer][:new_lft_axix_2]
			  pres_new.save
	        end
	        pd = ProgressiveDetail.where(:customer_id =>cust.id).first
            if pd.present?
          	  pd.repd = params[:customer][:re_pd]
	          pd.lepd = params[:customer][:le_pd]
	          pd.befh = params[:customer][:befh]
	          pd.ed = params[:customer][:ed]
	          pd.customer_id = cust.id
	          pd.save
            end 
            recom = Recommendation.where(:customer_id =>cust.id).first
	        if recom.present?
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
	        adinfo = AdditionalInfo.where(:customer_id =>cust.id).first
	        if adinfo.present?
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

        else
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
		      pres_old = PrescriptionSpectacleOld.new
			  pres_old.customer_id = cust.id
			  pres_old.old_rgt_sph_1  = params[:customer][:old_rgt_sph_1]
			  pres_old.old_rgt_cyl_1  = params[:customer][:old_rgt_cyl_1]
			  pres_old.old_rgt_axix_1 = params[:customer][:old_rgt_axix_1]
			  pres_old.old_rgt_sph_2  = params[:customer][:old_rgt_sph_2]
			  pres_old.old_rgt_cyl_2  = params[:customer][:old_rgt_cyl_2]
			  pres_old.old_rgt_axix_2 = params[:customer][:old_rgt_axix_2]
			  pres_old.old_lft_sph_1  = params[:customer][:old_lft_sph_1]
			  pres_old.old_lft_cyl_1  = params[:customer][:old_lft_cyl_1]
			  pres_old.old_lft_axix_1 = params[:customer][:old_lft_axix_1]
			  pres_old.old_lft_sph_2  = params[:customer][:old_lft_sph_2]
			  pres_old.old_lft_cyl_2  = params[:customer][:old_lft_cyl_2]
			  pres_old.old_lft_axix_2 = params[:customer][:old_lft_axix_2]
			  pres_old.save
		
	       
		      pres_new = PrescriptionSpectacleNew.new
			  pres_new.customer_id = cust.id
			  pres_new.new_rgt_sph_1  = params[:customer][:new_rgt_sph_1]
			  pres_new.new_rgt_cyl_1  = params[:customer][:new_rgt_cyl_1]
			  pres_new.new_rgt_axix_1 = params[:customer][:new_rgt_axix_1]
			  pres_new.new_rgt_sph_2  = params[:customer][:new_rgt_sph_2]
			  pres_new.new_rgt_cyl_2  = params[:customer][:new_rgt_cyl_2]
			  pres_new.new_rgt_axix_2 = params[:customer][:new_rgt_axix_2]
			  pres_new.new_lft_sph_1  = params[:customer][:new_lft_sph_1]
			  pres_new.new_lft_cyl_1  = params[:customer][:new_lft_cyl_1]
			  pres_new.new_lft_axix_1 = params[:customer][:new_lft_axix_1]
			  pres_new.new_lft_sph_2  = params[:customer][:new_lft_sph_2]
			  pres_new.new_lft_cyl_2  = params[:customer][:new_lft_cyl_2]
			  pres_new.new_lft_axix_2 = params[:customer][:new_lft_axix_2]
			  pres_new.save

			  pd = ProgressiveDetail.new
			  pd.repd = params[:customer][:re_pd]
	          pd.lepd = params[:customer][:le_pd]
	          pd.befh = params[:customer][:befh]
	          pd.ed = params[:customer][:ed]
	          pd.customer_id = cust.id
	          pd.save


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
	    end

	  respond_to do |format|
	      if cust.present?
	         format.html { redirect_to({:action => :index}, {:notice => 'Customer was successfully created.'}) }
	      end
	  end
  end

  def edit
  	@cust = Customer.find(params[:cid])
  	@pres_old = PrescriptionSpectacleOld.where(:customer_id => @cust.id).first
  	puts "#{@pres_old.inspect}"
  	@pres_new = PrescriptionSpectacleNew.where(:customer_id => @cust.id).first
  	@pd = ProgressiveDetail.where(:customer_id => @cust.id).first
  	@recom = Recommendation.where(:customer_id => @cust.id).first
  	@adinfo = AdditionalInfo.where(:customer_id => @cust.id).first
  end

end
