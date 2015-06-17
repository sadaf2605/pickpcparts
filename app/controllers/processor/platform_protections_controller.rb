class Processor::PlatformProtectionsController < ApplicationController
  before_action :set_processor_platform_protection, only: [:show, :edit, :update, :destroy]

  # GET /processor/platform_protections
  # GET /processor/platform_protections.json
  def index
    @processor_platform_protections = Processor::PlatformProtection.all
  end

  # GET /processor/platform_protections/1
  # GET /processor/platform_protections/1.json
  def show
  end

  # GET /processor/platform_protections/new
  def new
    @processor_platform_protection = Processor::PlatformProtection.new
  end

  # GET /processor/platform_protections/1/edit
  def edit
  end

  # POST /processor/platform_protections
  # POST /processor/platform_protections.json
  def create
    @processor_platform_protection = Processor::PlatformProtection.new(processor_platform_protection_params)

    respond_to do |format|
      if @processor_platform_protection.save
        format.html { redirect_to @processor_platform_protection, notice: 'Platform protection was successfully created.' }
        format.json { render :show, status: :created, location: @processor_platform_protection }
      else
        format.html { render :new }
        format.json { render json: @processor_platform_protection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processor/platform_protections/1
  # PATCH/PUT /processor/platform_protections/1.json
  def update
    respond_to do |format|
      if @processor_platform_protection.update(processor_platform_protection_params)
        format.html { redirect_to @processor_platform_protection, notice: 'Platform protection was successfully updated.' }
        format.json { render :show, status: :ok, location: @processor_platform_protection }
      else
        format.html { render :edit }
        format.json { render json: @processor_platform_protection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processor/platform_protections/1
  # DELETE /processor/platform_protections/1.json
  def destroy
    @processor_platform_protection.destroy
    respond_to do |format|
      format.html { redirect_to processor_platform_protections_url, notice: 'Platform protection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processor_platform_protection
      @processor_platform_protection = Processor::PlatformProtection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processor_platform_protection_params
      params.require(:processor_platform_protection).permit(:trusted_execution_technology, :execute_disable_bit)
    end
end
