ActiveAdmin.register Motherboard do


  show do
    attributes_table_for motherboard do
      row :manufacturer
      row :part_no
      row :form_factor_str do
        motherboard.form_factor.name
      end
      row :cpu_socket_str do
        motherboard.cpu_socket.name
      end
      row :chipset
      row :memory_slot_str do
        motherboard.memory_slot.name
      end
      row :memory_type
      row :max_memory
      row :raid_support
      row :onboard_video
      row :crossfire_support
      row :sli_support
      row :sata_6_gbs
      row :onboard_ethernet
      row :onboard_usb_3_headers
    end
  end


  form do |f|
    f.inputs do
     f.semantic_fields_for [:product, f.object.product || Product.new] do |p|
          p.input :manufacturer
          p.input :part_no
      end
      
     f.semantic_fields_for [:cpu_socket, f.object.cpu_socket || CpuSocket.new], heading: 'Themes', allow_destroy: true, new_record: true do |a|
          a.input :name,:label=>"Socket", :as => :select, :collection => CpuSocket.all.collect {|cpu_socket| [cpu_socket.name, cpu_socket.id] }
      end
      
      f.semantic_fields_for [:form_factor, f.object.form_factor || FormFactor.new], heading: 'Themes', allow_destroy: true, new_record: true do |a|
          a.input :name,:label=>"Form Factor", :as => :select, :collection => FormFactor.all.collect {|form_factor| [form_factor.name, form_factor.id] }
      end
      
#      input :form_factor_str, :input_html => { :value => if f.object.form_factor then f.object.form_factor.name else "" end }
      
      input :cpu_socket_str, :input_html => { :value => if f.object.cpu_socket then f.object.cpu_socket.name else "" end }
      input :chipset
      input :memory_slot_str, :input_html => { :value => if f.object.memory_slot then f.object.memory_slot.name else "" end }
      input :memory_type
      input :max_memory
      input :raid_support
      input :onboard_video
      input :crossfire_support
      input :sli_support
      input :sata_6_gbs
      input :onboard_ethernet
      input :onboard_usb_3_headers

    end
    actions
  end


controller do
  def create
    @motherboard = Motherboard.new(motherboard_params)
    @motherboard.cpu_socket = CpuSocket.find_by_name(params[:motherboard][:cpu_socket][:name]) || CpuSocket.create({:name =>params[:motherboard][:cpu_socket][:name]})
#    @motherboard.cpu_socket = CpuSocket.find_by_name(params[:motherboard][:cpu_socket_str]) || CpuSocket.create({:name =>params[:motherboard][:cpu_socket_str]})

    num_slot = params[:motherboard][:memory_slot_str].split(" x ")


    @motherboard.memory_slot_num=Integer(num_slot[0].strip)
    memory_slot_name=num_slot[1].strip
    @motherboard.memory_slot = MemorySlot.find_by_name(memory_slot_name) || MemorySlot.create({:name => memory_slot_name})

    #@motherboard.form_factor =FormFactor.find_by_name(params[:motherboard][:form_factor_str]) || FormFactor.create({:name=> params[:motherboard][:form_factor_str]})
    @motherboard.form_factor = FormFactor.find_by_name(params[:motherboard][:form_factor][:name]) || FormFactor.create({:name=> params[:motherboard][:form_factor][:name]})
    @motherboard.product = Product.create(product_params)
    
    respond_to do |format|
      if @motherboard.save
        format.html { redirect_to [:admin,@motherboard], notice: 'Motherboard was successfully created.' }
      else
        format.html { render :new }

      end
    end
  end
  def motherboard_params
    params.require(:motherboard).permit(:manufacturer, :part_no, :form_factor, :chipset, :memory_slots, :memory_type, :max_memory, :raid_support, :onboard_video, :crossfire_support, :sli_support, :sata_6_gbs, :onboard_ethernet, :onboard_usb_3_headers)
  end
    def product_params
      params[:motherboard][:product].permit(:manufacturer, :part_no)
    end
end


end
