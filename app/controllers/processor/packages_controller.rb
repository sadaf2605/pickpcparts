class Processor::PackagesController < ApplicationController
  before_action :set_processor_package, only: [:show, :edit, :update, :destroy]

  # GET /processor/packages
  # GET /processor/packages.json
  def index
    @processor_packages = Processor::Package.all
  end

  # GET /processor/packages/1
  # GET /processor/packages/1.json
  def show
  end

  # GET /processor/packages/new
  def new
    @processor_package = Processor::Package.new
  end

  # GET /processor/packages/1/edit
  def edit
  end

  # POST /processor/packages
  # POST /processor/packages.json
  def create
    @processor_package = Processor::Package.new(processor_package_params)

    respond_to do |format|
      if @processor_package.save
        format.html { redirect_to @processor_package, notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: @processor_package }
      else
        format.html { render :new }
        format.json { render json: @processor_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processor/packages/1
  # PATCH/PUT /processor/packages/1.json
  def update
    respond_to do |format|
      if @processor_package.update(processor_package_params)
        format.html { redirect_to @processor_package, notice: 'Package was successfully updated.' }
        format.json { render :show, status: :ok, location: @processor_package }
      else
        format.html { render :edit }
        format.json { render json: @processor_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processor/packages/1
  # DELETE /processor/packages/1.json
  def destroy
    @processor_package.destroy
    respond_to do |format|
      format.html { redirect_to processor_packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processor_package
      @processor_package = Processor::Package.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processor_package_params
      params.require(:processor_package).permit(:max_cpu_configuration, :TCASE_in_C, :package_width_in_mn, :package_length_in_mn, :graphics_and_imc_lithography_in_nm, :low_halogen_options_available)
    end
end
