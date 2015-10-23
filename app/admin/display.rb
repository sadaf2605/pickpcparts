ActiveAdmin.register Display do
  menu parent: "Parts", priority: 10


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

      parts_inputs_for(Display,f){}
    
    end
    actions
  end

  controller do
    def create
      @display = Display.new(display_params)
      @display.build_with_market_status(params[:display])
      
      respond_to do |format|
        if @display.save
          format.html { redirect_to [:admin,@display], notice: 'Display was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end
    
 

    def update
      @display = Display.find(params[:id])
      @display.product.update(ProductsController.product_params(params[:display]))
      @display.build_with_market_status(params[:display])

      if @display.update_attributes(display_params)
        super
      end

    end

    def display_params
      params.require(:display).permit(:product, :manufacturer,:avatar, :part_no,:form_factor,:interface,:cache,:cd_dash_rom_speed,:cd_dash_r_speed,:cd_dash_rw_speed,:dvd_dash_rom_speed,:dvd_plus_r_speed,:dvd_plus_r_dual_layer_Speed,:dvd_plus_rw_speed,:dvd_dash_r_speed,:dvd_dash_r_dual_layer_speed,:dvd_dash_rw_speed, :dvd_ram_speed)
    end
      
  end

end
