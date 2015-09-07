ActiveAdmin.register Cpu do
  menu parent: "Parts", priority: 1

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
permit_params :cpu
  form(:html => { :multipart => true })  do |f| 
    f.inputs do
      parts_inputs_for(Cpu,f){
        input :cpu_socket, :hint => add_remove_links(new_admin_cpu_socket_path,admin_cpu_sockets_path,"socket")
      }
    end
    actions
  end



  controller do
    def create

      @cpu = Cpu.new(cpu_params)

#      @cpu.cpu_socket. = CpuSocket.find_by_name(params[:cpu][:cpu_socket][:name])
      #puts params[:cpu][:cpu_socket][:name]
      
      @cpu.build_with_market_status(params[:cpu])

      respond_to do |format|
        if @cpu.save
          format.html { redirect_to [:admin, @cpu], notice: 'Cpu was successfully created.' }
        else
          puts params
          puts @cpu.cpu_socket

          format.html { render :new }

        end
      end
    end


    def update

      @cpu = Cpu.find(params[:id])
      @cpu.product.update(ProductsController.product_params(params[:cpu]))
      @cpu.build_with_market_status(params[:cpu])
      

      if @cpu.update_attributes(cpu_params)
        super
      end
      
    end

    def cpu_params
      params.require(:cpu).permit(:product, :cpu_socket, :model, :data_width, :speed, :cores, :l1_cache, :l2_cache, :l3_cache, :lithography, :thermal_design_power, :includes_cpu_cooler, :hyper_threading, :integrated_graphics, :cpu_socket_id)
    end

  end


  
end
