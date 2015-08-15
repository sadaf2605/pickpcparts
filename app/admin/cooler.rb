ActiveAdmin.register Cooler do
  menu parent: "Parts", priority: 2

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

    show do
      attributes_table_for cooler do
        row :manufacturer
        row :part_no
        row :supported_sockets do
          cooler.cpu_sockets.join(" , ")
        end
        row :liquid_cooled
        row :radiator_size
        row :noise_level
        row :fan_rpm
      end
    end

  form(:html => { :multipart => true })  do |f|
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
        inputs :cpu_sockets
#      input :supported_sockets_str , :input_html => { :value => f.object.cpu_sockets.join(" , ") }
      input :liquid_cooled
      input :liquid_cooled
      input :radiator_size
      input :noise_level
      input :fan_rpm
    end
    actions
    end




  controller do
    def create
      @cooler = Cooler.new(cooler_params)

#      params[:cooler][:supported_sockets_str].split(",").each do |name|
#        name=name.strip
#        @cpu_socket=CpuSocket.find_by_name(name) || CpuSocket.create({:name => name})
#        @cooler.cpu_sockets << @cpu_socket
#        @cooler.product = Product.create(product_params)
#      end
        @cooler.cpu_sockets=[]
        params[:cooler][:cpu_socket_ids].each if not params[:cooler][:cpu_socket_ids].nil? do |id|
          if not id == ""
            @cooler.cpu_sockets << CpuSocket.find_by_id(id) 
          end
        end
       @cooler.build_with_market_status(params)
      
      
      respond_to do |format|
        if @cooler.save
          format.html { redirect_to [:admin, @cooler], notice: 'Cooler was successfully created.' }

        else
          format.html { render :new }

        end
      end
end
    def cooler_params
      params.require(:cooler).permit(:manufacturer, :part_no, :liquid_cooled, :radiator_size, :noise_level, :fan_rpm, :cpu_socket_ids)
    end


  end
  end
