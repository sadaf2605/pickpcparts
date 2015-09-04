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
        input :cpu_socket, heading: 'Themes', allow_destroy: true, new_record: true
      }
    end
    actions
  end



  controller do
    def create

      @cpu = Cpu.new(cpu_params)

#      @cpu.cpu_socket = CpuSocket.find(params[:cpu][:cpu_socket][:name])
      @cpu.build_with_market_status(params[:cpu])

        respond_to do |format|
          if @cpu.save
            format.html { redirect_to [:admin, @cpu], notice: 'Cpu was successfully created.' }
          else
#            puts @cpu
            format.html { render :new }

          end
        end
      end



    def cpu_params
      params.require(:cpu).permit(:product, :cpu_socket, :model, :data_width, :speed, :cores, :l1_cache, :l2_cache, :l3_cache, :lithography, :thermal_design_power, :includes_cpu_cooler, :hyper_threading, :integrated_graphics, :cpu_socket_id)
    end

  end


  
end
