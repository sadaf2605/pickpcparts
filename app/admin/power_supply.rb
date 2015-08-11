ActiveAdmin.register PowerSupply do


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
  
    index do
    selectable_column
    column :wattage
    column :fans
    column :modular
    column :efficiency_certification
    column :efficiency
    column :output
    column :pci_express_6_plus_2_pin_connectors

  end

 form do |f|
    inputs do
      f.semantic_fields_for [:product, f.object.product || Product.new] do |p|
          p.input :manufacturer
          p.input :part_no
      end
      input :wattage
      input :fans
      input :modular
      input :efficiency_certification
      input :efficiency
      input :output
      input :pci_express_6_plus_2_pin_connectors 
      
     
    end
    actions
  end

  
    controller do
    def create
      @power_supply = PowerSupply.new(power_supply_params)
      @power_supply.product = Product.create(product_params)

        respond_to do |format|
          if @power_supply.save
            format.html { redirect_to [:admin, @power_supply], notice: 'Power Supply was successfully created.' }
          else
            format.html { render renderer_for(:edit) }
          end
        end
      end


    def power_supply_params
      params.require(:power_supply).permit(:manufacturer, :part_no, :power_supply_type, :wattage, :fans, :modular, :efficiency_certification, :efficiency, :output, :pci_express_6_plus_2_pin_connectors)
    end
    
    def product_params
      params[:power_supply][:product].permit(:manufacturer, :part_no)
    end

  end

end
