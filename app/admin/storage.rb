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
        f.semantic_fields_for [:product, f.object.product || Product.new] do |p|
          p.input :manufacturer
          p.input :part_no 
          p.input :avatar, :as => :file, :hint => image_tag(f.object.product.avatar) if not f.object.product.nil?
      
            p.has_many :market_statuses, for: [:market_statuses,  p.object.market_statuses || MarketStatus.new],allow_destroy: true do |a|
              a.input :price
              a.inputs :shop
            end
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
      @storage = Storage.new(storage_params)
#      @storage.product = Product.create(product_params)
      @storage.build_with_market_status(params)
        respond_to do |format|
          if @storage.save
            format.html { redirect_to [:admin, @storage], notice: 'Cpu was successfully created.' }
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
