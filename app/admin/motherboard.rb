ActiveAdmin.register Motherboard do
  menu parent: "Parts", priority: 3



  form do |f|
    f.inputs do

      parts_inputs_for(Motherboard,f){
        input :cpu_socket, :hint => add_remove_links(new_admin_cpu_socket_path,admin_cpu_sockets_path,"Socket")
        input :form_factor, :hint => add_remove_links(new_admin_form_factor_path,admin_form_factors_path,"Form Factor")
      }

    end
    actions
  end


controller do
  def create
    @motherboard = Motherboard.new(motherboard_params)
    @motherboard.build_with_market_status(params[:motherboard])

    respond_to do |format|
      if @motherboard.save
        format.html { redirect_to [:admin,@motherboard], notice: 'Motherboard was successfully created.' }
      else
        format.html { render :new }

      end
    end
  end
  
  def update
    @motherboard = Motherboard.find(params[:id])
    @motherboard.product.update(ProductsController.product_params(params[:motherboard]))
    @motherboard.build_with_market_status(params[:motherboard])

    @motherboard.cpu_socket= CpuSocket.find_by_id(params[:motherboard][:cpu_socket_id])
    @motherboard.form_factor= FormFactor.find_by_id(params[:motherboard][:form_factor_id])

    if @motherboard.update_attributes(motherboard_params)
      super
    end

  end


  def motherboard_params
    params.require(:motherboard).permit(:product,:manufacturer, :part_no, :form_factor_id, :chipset, :memory_slot_id, :memory_type, :max_memory, :raid_support, :onboard_video, :crossfire_support, :sli_support, :sata_6_gbs, :onboard_ethernet, :onboard_usb_3_headers,:cpu_socket_id)
  end
end


end
