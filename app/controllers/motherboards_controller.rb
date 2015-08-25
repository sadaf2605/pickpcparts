class MotherboardsController < ParentProductController
  before_action :set_motherboard, only: [:show, :edit, :update, :destroy]


  # GET /motherboards/1
  # GET /motherboards/1.json
  def show
  end

  # GET /motherboards/new
  def new
    @motherboard = Motherboard.new
  end

  # GET /motherboards/1/edit
  def edit
  end

  # POST /motherboards
  # POST /motherboards.json
  def create
    @motherboard = Motherboard.new(motherboard_params)
    
    @motherboard.cpu_socket = CpuSocket.find_by_name(params[:motherboard][:cpu_socket]) || CpuSocket.create({:name =>params[:motherboard][:cpu_socket]})
    
    num_slot = params[:motherboard][:memory_slot].split(" x ")


    @motherboard.memory_slot_num=Integer(num_slot[0].strip) 
    memory_slot_name=num_slot[1].strip
    @motherboard.memory_slot = MemorySlot.find_by_name(memory_slot_name) || MemorySlot.create({:name => memory_slot_name})

    @motherboard.form_factor =FormFactor.find_by_name(params[:motherboard][:form_factor_str]) || FormFactor.create({:name=> params[:motherboard][:form_factor_str]})
    
    respond_to do |format|
      if @motherboard.save
        format.html { redirect_to @motherboard, notice: 'Motherboard was successfully created.' }
        format.json { render :show, status: :created, location: @motherboard }
      else
        format.html { render :new }
        format.json { render json: @motherboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motherboards/1
  # PATCH/PUT /motherboards/1.json
  def update
    respond_to do |format|
      if @motherboard.update(motherboard_params)
        format.html { redirect_to @motherboard, notice: 'Motherboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @motherboard }
      else
        format.html { render :edit }
        format.json { render json: @motherboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motherboards/1
  # DELETE /motherboards/1.json
  def destroy
    @motherboard.destroy
    respond_to do |format|
      format.html { redirect_to motherboards_url, notice: 'Motherboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motherboard
      @motherboard = Motherboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def motherboard_params
      params.require(:motherboard).permit(:manufacturer, :part_no, :form_factor, :chipset, :memory_slots, :memory_type, :max_memory, :raid_support, :onboard_video, :crossfire_support, :sli_support, :sata_6_gbs, :onboard_ethernet, :onboard_usb_3_headers)
    end
end
