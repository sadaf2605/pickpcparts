class CpuCasesController < ApplicationController
  before_action :set_cpu_case, only: [:show, :edit, :update, :destroy]

  # GET /cpu_cases
  # GET /cpu_cases.json
  def index
    @cpu_cases = CpuCase.all
  end

  # GET /cpu_cases/1
  # GET /cpu_cases/1.json
  def show
  end

  # GET /cpu_cases/new
  def new
    @cpu_case = CpuCase.new

  end

  # GET /cpu_cases/1/edit
  def edit
  end

  # POST /cpu_cases
  # POST /cpu_cases.json
  def create
    @cpu_case = CpuCase.new(cpu_case_params)
    @cpu_case.length=cpu_case_params[:dimensions].split(" x ")[0].strip.sub('\"', '').to_f
    @cpu_case.width=cpu_case_params[:dimensions].split(" x ")[1].strip.sub('\"', '').to_f
    @cpu_case.height=cpu_case_params[:dimensions].split(" x ")[2].strip.sub('\"', '').to_f

    params[:cpu_case][:motherboard_compatibility].split(",").each do |form_factor|
      @cpu_case.motherboard_compatibility << FormFactor.find_or_create(name: form_factor)
    end

    respond_to do |format|
      if @cpu_case.save
        format.html { redirect_to @cpu_case, notice: 'Cpu case was successfully created.' }
        format.json { render :show, status: :created, location: @cpu_case }
      else
        format.html { render :new }
        format.json { render json: @cpu_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cpu_cases/1
  # PATCH/PUT /cpu_cases/1.json
  def update
    respond_to do |format|
      if @cpu_case.update(cpu_case_params)
        format.html { redirect_to @cpu_case, notice: 'Cpu case was successfully updated.' }
        format.json { render :show, status: :ok, location: @cpu_case }
      else
        format.html { render :edit }
        format.json { render json: @cpu_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpu_cases/1
  # DELETE /cpu_cases/1.json
  def destroy
    @cpu_case.destroy
    respond_to do |format|
      format.html { redirect_to cpu_cases_url, notice: 'Cpu case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cpu_case
      @cpu_case = CpuCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cpu_case_params
      params.require(:cpu_case).permit(:manufacturer, :part_no, :cpu_type, :color, :includes_power_supply, :external_5_25_bays, :internal_2_5_bays, :internal_3_5_bays, :front_panel_usb_3_0, :ports, :maximum_video_card_length, :dimensions)
    end
end
