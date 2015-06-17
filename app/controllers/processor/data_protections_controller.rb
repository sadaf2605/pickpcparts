class Processor::DataProtectionsController < ApplicationController
  before_action :set_processor_data_protection, only: [:show, :edit, :update, :destroy]

  # GET /processor/data_protections
  # GET /processor/data_protections.json
  def index
    @processor_data_protections = Processor::DataProtection.all
  end

  # GET /processor/data_protections/1
  # GET /processor/data_protections/1.json
  def show
  end

  # GET /processor/data_protections/new
  def new
    @processor_data_protection = Processor::DataProtection.new
  end

  # GET /processor/data_protections/1/edit
  def edit
  end

  # POST /processor/data_protections
  # POST /processor/data_protections.json
  def create
    @processor_data_protection = Processor::DataProtection.new(processor_data_protection_params)

    respond_to do |format|
      if @processor_data_protection.save
        format.html { redirect_to @processor_data_protection, notice: 'Data protection was successfully created.' }
        format.json { render :show, status: :created, location: @processor_data_protection }
      else
        format.html { render :new }
        format.json { render json: @processor_data_protection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processor/data_protections/1
  # PATCH/PUT /processor/data_protections/1.json
  def update
    respond_to do |format|
      if @processor_data_protection.update(processor_data_protection_params)
        format.html { redirect_to @processor_data_protection, notice: 'Data protection was successfully updated.' }
        format.json { render :show, status: :ok, location: @processor_data_protection }
      else
        format.html { render :edit }
        format.json { render json: @processor_data_protection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processor/data_protections/1
  # DELETE /processor/data_protections/1.json
  def destroy
    @processor_data_protection.destroy
    respond_to do |format|
      format.html { redirect_to processor_data_protections_url, notice: 'Data protection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processor_data_protection
      @processor_data_protection = Processor::DataProtection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processor_data_protection_params
      params.require(:processor_data_protection).permit(:AES_new_nstructions, :secure_key)
    end
end
