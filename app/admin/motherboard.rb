ActiveAdmin.register Motherboard do
  menu parent: "Parts", priority: 3



  form do |f|
    f.inputs do

      parts_inputs_for(Motherboard,f){
        input :cpu_socket
        input :form_factor
      }

    end
    actions
  end


controller do
  def create
    @motherboard = Motherboard.new(motherboard_params)
#    @motherboard.cpu_socket = CpuSocket.find_by_name(params[:motherboard][:cpu_socket][:name]) || CpuSocket.create({:name =>params[:motherboard][:cpu_socket][:name]})
#    @motherboard.cpu_socket = CpuSocket.find_by_name(params[:motherboard][:cpu_socket_str]) || CpuSocket.create({:name =>params[:motherboard][:cpu_socket_str]})

#    num_slot = params[:motherboard][:memory_slot_str].split(" x ")


#    @motherboard.memory_slot_num=Integer(num_slot[0].strip)
#    memory_slot_name=num_slot[1].strip
#    @motherboard.memory_slot = MemorySlot.find_by_name(memory_slot_name) || MemorySlot.create({:name => memory_slot_name})

    #@motherboard.form_factor =FormFactor.find_by_name(params[:motherboard][:form_factor_str]) || FormFactor.create({:name=> params[:motherboard][:form_factor_str]})
#    @motherboard.form_factor = FormFactor.find_by_name(params[:motherboard][:form_factor][:name]) || FormFactor.create({:name=> params[:motherboard][:form_factor][:name]})
#    @motherboard.product = Product.create(product_params)
    @motherboard.build_with_market_status(params[:motherboard])
    respond_to do |format|
      if @motherboard.save
        format.html { redirect_to [:admin,@motherboard], notice: 'Motherboard was successfully created.' }
      else
        format.html { render :new }

      end
    end
  end
  def motherboard_params
    params.require(:motherboard).permit(:product,:manufacturer, :part_no, :form_factor_id, :chipset, :memory_slot_id, :memory_type, :max_memory, :raid_support, :onboard_video, :crossfire_support, :sli_support, :sata_6_gbs, :onboard_ethernet, :onboard_usb_3_headers,:cpu_socket_id)
  end
    def product_params
      params[:motherboard][:product].permit(:manufacturer, :part_no)
    end
end


end
