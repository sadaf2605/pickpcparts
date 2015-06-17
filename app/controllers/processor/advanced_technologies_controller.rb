class Processor::AdvancedTechnologiesController < ApplicationController
  before_action :set_processor_advanced_technology, only: [:show, :edit, :update, :destroy]

  # GET /processor/advanced_technologies
  # GET /processor/advanced_technologies.json
  def index
    @processor_advanced_technologies = Processor::AdvancedTechnology.all
  end

  # GET /processor/advanced_technologies/1
  # GET /processor/advanced_technologies/1.json
  def show
  end

  # GET /processor/advanced_technologies/new
  def new
    @processor_advanced_technology = Processor::AdvancedTechnology.new
  end

  # GET /processor/advanced_technologies/1/edit
  def edit
  end

  # POST /processor/advanced_technologies
  # POST /processor/advanced_technologies.json
  def create
    @processor_advanced_technology = Processor::AdvancedTechnology.new(processor_advanced_technology_params)

    respond_to do |format|
      if @processor_advanced_technology.save
        format.html { redirect_to @processor_advanced_technology, notice: 'Advanced technology was successfully created.' }
        format.json { render :show, status: :created, location: @processor_advanced_technology }
      else
        format.html { render :new }
        format.json { render json: @processor_advanced_technology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processor/advanced_technologies/1
  # PATCH/PUT /processor/advanced_technologies/1.json
  def update
    respond_to do |format|
      if @processor_advanced_technology.update(processor_advanced_technology_params)
        format.html { redirect_to @processor_advanced_technology, notice: 'Advanced technology was successfully updated.' }
        format.json { render :show, status: :ok, location: @processor_advanced_technology }
      else
        format.html { render :edit }
        format.json { render json: @processor_advanced_technology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processor/advanced_technologies/1
  # DELETE /processor/advanced_technologies/1.json
  def destroy
    @processor_advanced_technology.destroy
    respond_to do |format|
      format.html { redirect_to processor_advanced_technologies_url, notice: 'Advanced technology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processor_advanced_technology
      @processor_advanced_technology = Processor::AdvancedTechnology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processor_advanced_technology_params
      params.require(:processor_advanced_technology).permit(:turbo_boost_technology, :vPro_technology, :hyper_threading_technology, :virtualization_technology_vtx, :virtualization_technology_for_directed_IO_vtd, :vtx_with_extended_page_tables_ept, :TSX_NI, :intel_64, :idle_states, :enhanced_speedstep_technology, :thermal_monitoring_technologies, :virtualization_technology_for_itanium_vti, :stable_image_platform_program_SIPP)
    end
end
