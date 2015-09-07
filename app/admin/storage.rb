ActiveAdmin.register Storage do
  menu parent: "Parts", priority: 4


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
      parts_inputs_for(Storage,f){

      }    
      

    end
    actions
  end


  controller do
    def create
      @storage = Storage.new(storage_params)
#      @storage.product = Product.create(product_params)
      @storage.build_with_market_status(params[:storage])
      respond_to do |format|
        if @storage.save
          format.html { redirect_to [:admin, @storage], notice: 'Cpu was successfully created.' }
        else
          format.html { render renderer_for(:edit) }
        end
      end
    end

    def update
      @storage = Storage.find(params[:id])
      @storage.product.update(ProductsController.product_params(params[:storage]))
      @storage.build_with_market_status(params[:storage])
  
      if @storage.update_attributes(storage_params)
        super
      end
    end
      
    def storage_params
      params.require(:storage).permit(:manufacturer, :part_no, :capacity, :interface, :cache, :form_factor, :ssd_controller, :nand_flash_type, :gb_1, :price_gb)
    end
  end


end
