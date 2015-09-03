ActiveAdmin.register Memory do
  menu parent: "Parts", priority: 3


  form do |f|
    inputs do
      parts_inputs_for(Memory,f){
        input :memory_type
      }
    end
    actions
  end


  controller do
    def create
      @memory = Memory.new(memory_params)
#      @memory.memory_type= MemorySlot.find_by_name(params[:memory][:memory_slot_str]) || MemorySlot.create({:name => params[:memory][:memory_slot_str]})
      @memory.build_with_market_status(params[:memory])
      
         
      @memory.memory_type= MemorySlot.find_by_id(params[:memory][:memory_slot_id])
      respond_to do |format|
        if @memory.save
          format.html { redirect_to [:admin,@memory], notice: 'Memory was successfully created.' }
          format.json { render :show, status: :created, location: @memory }
        else
          format.html { render :new }
          format.json { render json: @memory.errors, status: :unprocessable_entity }
        end
      end
    end
    def memory_params
      params.require(:memory).permit(:product, :manufacturer, :memory_type, :part_no, :speed, :size, :price_gb, :cas, :voltage, :heat_spreader, :ecc, :registered, :color)
    end
    
  end

    
end
