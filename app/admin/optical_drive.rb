ActiveAdmin.register OpticalDrive do
  menu parent: "Parts", priority: 9


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form do |f|
    f.inputs do

      parts_inputs_for(OpticalDrive,f){}

    end
    actions
  end


  controller do
    def create
      @optical_drive = OpticalDrive.new(optical_drive_params)
      @optical_drive.build_with_market_status(params[:optical_drive])
      
      respond_to do |format|
        if @optical_drive.save
          format.html { redirect_to [:admin,@optical_drive], notice: 'Optical Drive was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end
    
 

    def update
      @optical_drive = OpticalDrive.find(params[:id])
      @optical_drive.product.update(ProductsController.product_params(params[:optical_drive]))
      @optical_drive.build_with_market_status(params[:optical_drive])

      if @optical_drive.update_attributes(optical_drive_params)
        super
      end

    end

    def optical_drive_params
      params.require(:optical_drive).permit(:product, :manufacturer,:avatar, :part_no,:form_factor,:interface,:cache,:cd_dash_rom_speed,:cd_dash_r_speed,:cd_dash_rw_speed,:dvd_dash_rom_speed,:dvd_plus_r_speed,:dvd_plus_r_dual_layer_Speed,:dvd_plus_rw_speed,:dvd_dash_r_speed,:dvd_dash_r_dual_layer_speed,:dvd_dash_rw_speed, :dvd_ram_speed)
    end
      
  end


end