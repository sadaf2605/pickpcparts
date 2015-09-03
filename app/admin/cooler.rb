ActiveAdmin.register Cooler do
  menu parent: "Parts", priority: 2
    require "helper/active_admin_helper"


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


  form(:html => { :multipart => true })  do |f|
    f.inputs do
      parts_inputs_for(Cooler,f){
        input :cpu_sockets
      }

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
        
       @cooler.build_with_market_status(params[:cooler])
      
      
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
