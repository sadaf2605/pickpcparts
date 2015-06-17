class Processor::ProcessorPackagesController < ApplicationController
  before_action :set_processor_processor_package, only: [:show, :edit, :update, :destroy]

  # GET /processor/processor_packages
  # GET /processor/processor_packages.json
  def index
    @processor_processor_packages = Processor::ProcessorPackage.all
  end

  # GET /processor/processor_packages/1
  # GET /processor/processor_packages/1.json
  def show
  end

  # GET /processor/processor_packages/new
  def new
    @processor_processor_package = Processor::ProcessorPackage.new
  end

  # GET /processor/processor_packages/1/edit
  def edit
  end

  # POST /processor/processor_packages
  # POST /processor/processor_packages.json
  def create
    @processor_processor_package = Processor::ProcessorPackage.new(processor_processor_package_params)

    respond_to do |format|
      if @processor_processor_package.save
        format.html { redirect_to @processor_processor_package, notice: 'Processor package was successfully created.' }
        format.json { render :show, status: :created, location: @processor_processor_package }
      else
        format.html { render :new }
        format.json { render json: @processor_processor_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processor/processor_packages/1
  # PATCH/PUT /processor/processor_packages/1.json
  def update
    respond_to do |format|
      if @processor_processor_package.update(processor_processor_package_params)
        format.html { redirect_to @processor_processor_package, notice: 'Processor package was successfully updated.' }
        format.json { render :show, status: :ok, location: @processor_processor_package }
      else
        format.html { render :edit }
        format.json { render json: @processor_processor_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processor/processor_packages/1
  # DELETE /processor/processor_packages/1.json
  def destroy
    @processor_processor_package.destroy
    respond_to do |format|
      format.html { redirect_to processor_processor_packages_url, notice: 'Processor package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processor_processor_package
      @processor_processor_package = Processor::ProcessorPackage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processor_processor_package_params
      params.require(:processor_processor_package).permit(:max_cpu_configuration, :TCASE_in_C, :package_width_in_mn, :package_length_in_mn, :graphics_and_imc_lithography_in_nm, :low_halogen_options_available)
    end
end
