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
      f.semantic_fields_for [:product, f.object.product || Product.new] do |p|
          p.input :manufacturer
          p.input :part_no
      end
      
      f.semantic_fields_for [:memory_type, f.object.memory_type || MemorySlot.new] do |a|
          a.input :name,:label=>"Memory Type", :as => :select, :collection => MemorySlot.all.collect {|memory_slot| [memory_slot.name, memory_slot.id] }
      end
      
#      input :memory_slot_str, :input_html => { :value => if f.object.memory_type then f.object.memory_type.name else "" end }
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
#      @memory.memory_type= MemorySlot.find_by_name(params[:memory][:memory_slot_str]) || MemorySlot.create({:name => params[:memory][:memory_slot_str]})
      @memory.product =Product.create(product_params)
      @memory.memory_type= MemorySlot.find_by_name(params[:memory][:memory_slot][:name]) || MemorySlot.create({:name => params[:memory][:memory_slot][:name]})
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
def memory_params
      params.require(:memory).permit(:manufacturer, :memory_type, :part_no, :speed, :size, :price_gb, :cas, :voltage, :heat_spreader, :ecc, :registered, :color)
    end
    
    def product_params
      params[:memory][:product].permit(:manufacturer, :part_no)
    end
  end

    
end
