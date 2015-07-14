ActiveAdmin.register Memory do


  show do
    attributes_table_for memory do
      row :manufacturer
      row :part_no
      row :memory_slot_str do
        memory.memory_type.name
      end
      row :speed
      row :size
      row :price
      row :cas
      row :voltage
      row :heat_spreader
      row :ecc
      row :registered
      row :color

    end
  end


  form do |f|
    inputs do
      input :manufacturer
      input :part_no
      input :memory_slot_str, :input_html => { :value => if f.object.memory_type then f.object.memory_type.name else "" end }
      input :speed
      input :size
      input :price_gb
      input :cas
      input :voltage
      input :heat_spreader
      input :ecc
      input :registered
      input :color
    end
    actions
  end


  controller do
    def create
      @memory = Memory.new(memory_params)
      @memory.memory_type= MemorySlot.find_by_name(params[:memory][:memory_slot_str]) || MemorySlot.create({:name => params[:memory][:memory_slot_str]})

      respond_to do |format|
        if @memory.save
          format.html { redirect_to @memory, notice: 'Memory was successfully created.' }
          format.json { render :show, status: :created, location: @memory }
        else
          format.html { render :new }
          format.json { render json: @memory.errors, status: :unprocessable_entity }
        end
      end
    end

  end


end
