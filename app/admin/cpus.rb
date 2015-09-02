ActiveAdmin.register Cpu do
  menu parent: "Parts", priority: 1

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
      f.inputs :cpu_socket, heading: 'Themes', allow_destroy: true, new_record: true
#      f.semantic_fields_for [:cpu_socket, f.object.cpu_socket || CpuSocket.new], heading: 'Themes', allow_destroy: true, new_record: true do |a|
#          a.input :name,:label=>"Socket", :as => :select, :collection => CpuSocket.all.collect {|cpu_socket| [cpu_socket.name, cpu_socket.id] }
#      end

      
      f.semantic_fields_for [:product, f.object.product || Product.new] do |p|
          p.input :manufacturer
          p.input :part_no 
          p.input :avatar, :as => :file, :hint => image_tag(f.object.product.avatar) if not f.object.product.nil?
      
            p.has_many :market_statuses, for: [:market_statuses,  p.object.market_statuses || MarketStatus.new],allow_destroy: true do |a|
              a.input :price
              a.inputs :shop
            end
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
      
#      @cpu.cpu_socket = CpuSocket.find(params[:cpu][:cpu_socket][:name])
      @cpu.build_with_market_status(params[:cpu])


        respond_to do |format|
          if @cpu.save
            format.html { redirect_to [:admin, @cpu], notice: 'Cpu was successfully created.' }
          else
            format.html { render :new }
          end
        end
        rescue
          redirect_to 
      end


    def cpu_params
      params.require(:cpu).permit(:product, :cpu_socket, :model, :data_width, :speed, :cores, :l1_cache, :l2_cache, :l3_cache, :lithography, :thermal_design_power, :includes_cpu_cooler, :hyper_threading, :integrated_graphics, :cpu_socket_id)
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
