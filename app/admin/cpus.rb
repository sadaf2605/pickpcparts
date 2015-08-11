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
      f.semantic_fields_for [:cpu_socket, f.object.cpu_socket || CpuSocket.new], heading: 'Themes', allow_destroy: true, new_record: true do |a|
          a.input :name,:label=>"Socket", :as => :select, :collection => CpuSocket.all.collect {|cpu_socket| [cpu_socket.name, cpu_socket.id] }
      end
      
      f.semantic_fields_for [:product, f.object.product || Product.new] do |p|
          p.input :manufacturer
          p.input :part_no
      end
      
      input :model
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
      @cpu.product = Product.create(product_params)

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
    
    def product_params
      params[:cpu][:product].permit(:manufacturer, :part_no)
    end

  end


 show do
    attributes_table do
      row :manufacturer do
        cpu.product.manufacturer
      end
    end
    active_admin_comments
  end
  
end