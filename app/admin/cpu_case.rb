ActiveAdmin.register CpuCase do
  menu parent: "Parts", priority: 7


  show do
    attributes_table_for cpu_case do
      row :manufacturer
      row :color
      row :includes_power_supply
      row :external_5_25_bays
      row :internal_2_5_bays
      row :internal_3_5_bays
      row :motherboard_compatibility_str do
        cpu_case.motherboard_compatibility.join(" , ")
     end
      row :front_panel_usb_3_0
      row :ports
      row :maximum_video_card_length
      row :length
      row :width
      row :height
    end
  end


  form do |f|
    inputs do
        
        f.semantic_fields_for [:product, f.object.product || Product.new] do |p|
          p.input :manufacturer
          p.input :part_no 
          p.input :avatar, :as => :file, :hint => image_tag(f.object.product.avatar) if not f.object.product.nil?
      
            p.has_many :market_statuses, for: [:market_statuses,  p.object.market_statuses || MarketStatus.new],allow_destroy: true do |a|
              a.input :price
              a.inputs :shop
            end
          end
     
      
      input :color
      input :includes_power_supply
      input :external_5_25_bays
      input :internal_2_5_bays
      input :internal_3_5_bays
      input :motherboard_compatibility
#      input :motherboard_compatibility_str, :input_html => { :value => if f.object.motherboard_compatibility then f.object.motherboard_compatibility.join(" , ") else "" end }
      input :front_panel_usb_3_0
      input :ports
      input :maximum_video_card_length
      input :length
      input :width
      input :height
    end
    actions
  end


  controller do
    def create
      @cpu_case = CpuCase.new(cpu_case_params)
#      params[:cpu_case][:motherboard_compatibility_str].split(",").each do |form_factor|
#        @cpu_case.motherboard_compatibility << FormFactor.find_or_create_by(name: form_factor)
#      end

      @cpu_case.motherboard_compatibility=[]
       params[:cpu_case][:motherboard_compatibility_ids].each if not params[:cpu_case][:motherboard_compatibility_ids].nil? do |id|
          if not id == ""
            @cpu_case.motherboard_compatibility << FormFactor.find_by_id(id) 
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

    def cpu_case_params
      params.require(:cpu_case).permit(:manufacturer, :part_no, :cpu_type, :color, :includes_power_supply, :external_5_25_bays, :internal_2_5_bays, :internal_3_5_bays, :front_panel_usb_3_0, :ports, :maximum_video_card_length, :dimensions, :width,:height, :length)
    end
    

  end



end
