ActiveAdmin.register Cpu do

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

  form do |f|
    f.inputs do
#      input :cpu_socket_str, :input_html => { :value => if f.object.cpu_socket then f.object.cpu_socket.name else "" end }
      f.fields_for :cpu_sockets, heading: 'Themes', allow_destroy: true, new_record: true do |a|
       
        if a.object.nil?
          a.input :name, :as => :select, :collection => CpuSocket.all.collect {|cpu_socket| [cpu_socket.name, cpu_socket.id] }
          
          a.input :names, :label => f.object.cpu_socket.name          
        else
          a.input :names, :label => a.object.cpu_socket.name
          a.input :_destroy, :as => :boolean, :label => :delete
        end
       # a.collection_select(:cpu_id, CpuSocket.all, :id, :name)
      end
      #render 'layouts/add_sockets_field', cpu_socket: CpuSocket.new
      
      input :manufacturer
      input :model
      input :part_no
      input :data_width
      input :speed
      input :cores
      input :l1_cache
      input :l2_cache
      input :l3_cache
      input :lithography
      input :thermal_design_power
    end
    actions
  end



  controller do
    def create
      @cpu = Cpu.new(cpu_params)
      @cpu.cpu_socket = CpuSocket.find_by_name(params[:cpu][:cpu_sockets][:name]) ||
          CpuSocket.create({ :name => params[:cpu][:cpu_sockets][:name] })

        respond_to do |format|
          if @cpu.save
            format.html { redirect_to [:admin, @cpu], notice: 'Cpu was successfully created.' }
          else
            format.html { render renderer_for(:edit) }
          end
        end
      end


    def cpu_params
      params.require(:cpu).permit(:manufacturer, :model, :part_no, :data_width, :speed, :cores, :l1_cache, :l2_cache, :l3_cache, :lithography, :thermal_design_power, :includes_cpu_cooler, :hyper_threading, :integrated_graphics, :cpu_socket_id)
    end

  end



end
