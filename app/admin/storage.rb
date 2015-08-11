ActiveAdmin.register Storage do


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
      f.semantic_fields_for [:product, f.object.product || Product.new] do |p|
          p.input :manufacturer
          p.input :part_no
      end
      
      input :capacity
      input :interface
      input :cache
      
      input :form_factor
      input :ssd_controller
      input :nand_flash_type
      input :gb_1
      input :price_gb
    end
    actions
  end


  controller do
    def create
      @cpu = Storage.new(storage_params)
      @cpu.product = Product.create(product_params)

        respond_to do |format|
          if @cpu.save
            format.html { redirect_to [:admin, @cpu], notice: 'Cpu was successfully created.' }
          else
            format.html { render renderer_for(:edit) }
          end
        end
      end
      
      def storage_params
        params.require(:storage).permit(:manufacturer, :part_no, :capacity, :interface, :cache, :form_factor, :ssd_controller, :nand_flash_type, :gb_1, :price_gb)
      end
      def product_params
        params[:storage][:product].permit(:manufacturer, :part_no)
      end
  end


end
