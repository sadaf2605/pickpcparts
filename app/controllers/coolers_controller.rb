class CoolersController < ApplicationController
  before_action :set_cooler, only: [:show, :edit, :update, :destroy]

  # GET /coolers
  # GET /coolers.json
  def index
    @coolers = Cooler.all
  end

  # GET /coolers/1
  # GET /coolers/1.json
  def show
  end

  # GET /coolers/new
  def new
    @cooler = Cooler.new
  end

  # GET /coolers/1/edit
  def edit
  end

  # POST /coolers
  # POST /coolers.json
  def create
    @cooler = Cooler.new(cooler_params)

    params[:cooler][:cpu_socket].split(",").each do |name|
      @cpu_socket=CpuSocket.find_by_name(name) || CpuSocket.create({:name => name})
      @cooler.cpu_sockets <<@cpu_socket
    end

    respond_to do |format|
      if @cooler.save
        format.html { redirect_to @cooler, notice: 'Cooler was successfully created.' }
        format.json { render :show, status: :created, location: @cooler }
      else
        format.html { render :new }
        format.json { render json: @cooler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coolers/1
  # PATCH/PUT /coolers/1.json
  def update
    respond_to do |format|
      if @cooler.update(cooler_params)
        format.html { redirect_to @cooler, notice: 'Cooler was successfully updated.' }
        format.json { render :show, status: :ok, location: @cooler }
      else
        format.html { render :edit }
        format.json { render json: @cooler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coolers/1
  # DELETE /coolers/1.json
  def destroy
    @cooler.destroy
    respond_to do |format|
      format.html { redirect_to coolers_url, notice: 'Cooler was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cooler
      @cooler = Cooler.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cooler_params
      params.require(:cooler).permit(:manufacturer, :part_no, :liquid_cooled, :radiator_size, :noise_level, :fan_rpm)
    end
end
