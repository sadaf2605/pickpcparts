ActiveAdmin.register CpuCase do
  menu parent: "Parts", priority: 7


 


  form do |f|
    inputs do
        
    parts_inputs_for(CpuCase,f){
        input :form_factors
      }
    end
    actions
  end


  controller do
    def create
      @cpu_case = CpuCase.new(cpu_case_params)
#      params[:cpu_case][:motherboard_compatibility_str].split(",").each do |form_factor|
#        @cpu_case.motherboard_compatibility << FormFactor.find_or_create_by(name: form_factor)
#      end

      @cpu_case.form_factors=[]
      
      if not params[:cpu_case][:form_factor_ids].nil?
         params[:cpu_case][:form_factor_ids].each  do |id|
          puts params[:cpu_case][:form_factor_ids]
            if not id == ""
              @cpu_case.form_factors << FormFactor.find_by_id(id.to_i) 
            end
          end
      end
      
      @cpu_case.build_with_market_status(params[:cpu_case])
      
      respond_to do |format|
        if @cpu_case.save
          format.html { redirect_to [:admin, @cpu_case], notice: 'Cpu case was successfully created.' }
          format.json { render :show, status: :created, location: @cpu_case }
        else
          format.html { render :new }
          format.json { render json: @cpu_case.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @cpu_case = CpuCase.find(params[:id])
      @cpu_case.product.update(ProductsController.product_params(params[:cpu_case]))
      @cpu_case.build_with_market_status(params[:cpu_case])
       

      @cpu_case.form_factors=[]

       params[:cpu_case][:form_factors_ids].each if not params[:cpu_case][:form_factors_ids].nil? do |id|
          if not id == ""
            @cpu_case.form_factors << FormFactor.find_by_id(id) 
          end
        end


      if @cpu_case.update_attributes(cpu_case_params)
        super
      end

    end

    def cpu_case_params
      params.require(:cpu_case).permit(:form_factor_ids,:manufacturer, :part_no, :cpu_type, :color, :includes_power_supply, :external_5_25_bays, :internal_2_5_bays, :internal_3_5_bays, :front_panel_usb_3_0, :ports, :maximum_video_card_length, :dimensions, :width,:height, :length)
    end
    

  end



end
