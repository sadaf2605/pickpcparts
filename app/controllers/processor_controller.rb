class ProcessorController < ApplicationController
  before_action :set_processor_processor, only: [:show, :edit, :update, :destroy]

  # GET /processor
  # GET /processor.json
  def index
    @processor_processors = Processor::Processor.all
  end

  # GET /processor/processors/1
  # GET /processor/processors/1.json
  def show
  end

  # GET /processor/processors/new
  def new
    @processor_processor = Processor::Processor.new

  end

  # GET /processor/processors/1/edit
  def edit
  end

  # POST /processor/processors
  # POST /processor/processors.json
  def create
    @processor_processor = Processor::Processor.new(processor_processor_params)
    @processor_performance = Processor::Performance.create(processor_performance_params)
    @processor_memory = Processor::Memory.create(processor_memory_params)
    @processor_graphic = Processor::Graphic.create(processor_graphic_params)
    @processor_advanced_technology = Processor::AdvancedTechnology.create(processor_advanced_technology_params)
    @processor_expansion = Processor::Expansion.create(processor_expansion_params)
    @processor_package = Processor::Package.create(processor_package_params)
    @processor_data_protection = Processor::DataProtection.create(processor_data_protection_params)
    @processor_platform_protection = Processor::PlatformProtection.create(processor_platform_protection_params)

    @processor_processor.processor_performance = @processor_performance
    @processor_processor.processor_memory = @processor_memory
    @processor_processor.processor_graphic = @processor_graphic
    @processor_processor.processor_advanced_technology = @processor_advanced_technology
    @processor_processor.processor_expansion = @processor_expansion
    @processor_processor.processor_package = @processor_package
    @processor_processor.processor_data_protection = @processor_data_protection
    @processor_processor.processor_platform_protection = @processor_platform_protection

    respond_to do |format|
      if @processor_processor.save
        format.html { redirect_to @processor_processor, notice: 'Processor was successfully created.' }
        format.json { render :show, status: :created, location: @processor_processor }
      else
        format.html { render :new }
        format.json { render json: @processor_processor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processor/processors/1
  # PATCH/PUT /processor/processors/1.json
  def update
    respond_to do |format|
      if @processor_processor.update(processor_processor_params)
        format.html { redirect_to @processor_processor, notice: 'Processor was successfully updated.' }
        format.json { render :show, status: :ok, location: @processor_processor }
      else
        format.html { render :edit }
        format.json { render json: @processor_processor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processor/processors/1
  # DELETE /processor/processors/1.json
  def destroy
    @processor_processor.destroy
    respond_to do |format|
      format.html { redirect_to processor_processors_url, notice: 'Processor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_processor_processor
    @processor_processor = Processor::Processor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def processor_processor_params
    params.permit(:processor_number, :cache_in_MB, :DMI2_in_GTs, :instruction_set_in_bit, :instruction_set_extensions, :embedded_options_available, :lithography_in_nm, :scalability)
  end

  def processor_performance_params
    params.require(:processor_processor).permit(:no_of_cores, :no_of_threads, :processor_base_frequency_in_GHz, :thermal_design_power_in_W)
  end
  def processor_memory_params
    params.require(:processor_processor).permit(:max_memory_size_GB, :max_no_of_memory_channels, :max_memory_bandwidth_in_GBs, :ecc_memory_supported)
  end

  def processor_graphic_params
    params.require(:processor_processor).permit(:processor_graphics, :graphics_base_frequency_in_MHz, :graphics_max_dynamic_frequency_GHz, :graphics_video_max_memory_in_GB, :quick_sync_video, :wireless_display, :clear_video_hd_technology, :no_of_display_supported)
  end

  def processor_expansion_params
    params.require(:processor_processor).permit(:PCI_express_revision, :max_no_of_PCI_express_lanes)
  end

  def processor_package_params
    params.require(:processor_processor).permit(:max_cpu_configuration, :TCASE_in_C, :package_width_in_mn, :package_length_in_mn, :graphics_and_imc_lithography_in_nm, :low_halogen_options_available)
  end

  def processor_advanced_technology_params
    params.require(:processor_processor).permit(:turbo_boost_technology, :vPro_technology, :hyper_threading_technology, :virtualization_technology_vtx, :virtualization_technology_for_directed_IO_vtd, :vtx_with_extended_page_tables_ept, :TSX_NI, :intel_64, :idle_states, :enhanced_speedstep_technology, :thermal_monitoring_technologies, :virtualization_technology_for_itanium_vti, :stable_image_platform_program_SIPP)
  end

  def processor_data_protection_params
    params.require(:processor_processor).permit(:AES_new_nstructions,:secure_key)
  end

  def processor_platform_protection_params
    params.require(:processor_processor).permit(:trusted_execution_technology, :execute_disable_bit)
  end


end
