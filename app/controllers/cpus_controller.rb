class CpusController < ApplicationController
  before_action :set_cpu, only: [:show, :edit, :update, :destroy]
 protect_from_forgery :except => :index
  # GET /cpus
  # GET /cpus.json
  def index
      @grid = CpusGrid.new(params[:cpus_grid]) do |scope|
        scope.page(params[:page])
      end
      respond_to do |format|
        format.html
        format.js
      end
  end

  # GET /cpus/1
  # GET /cpus/1.json
  def show
  end

  # GET /cpus/new
  def new
    @cpu = Cpu.new
  end

  # GET /cpus/1/edit
  def edit
  end

  # POST /cpus
  # POST /cpus.json
  def create
    @cpu = Cpu.new(cpu_params)
    @cpu.cpu_socket = CpuSocket.find_by_name(params[:cpu][:cpu_socket_str]) ||
                      CpuSocket.create({ :name => params[:cpu][:cpu_socket_str] })

    respond_to do |format|
      if @cpu.save
        format.html { redirect_to @cpu, notice: 'Cpu was successfully created.' }
        format.json { render :show, status: :created, location: @cpu }
      else
        format.html { render :new }
        format.json { render json: @cpu.errors, status: :unprocessable_entity }
      end

    end
  end

  # PATCH/PUT /cpus/1
  # PATCH/PUT /cpus/1.json
  def update
    respond_to do |format|
      if @cpu.update(cpu_params)
        format.html { redirect_to @cpu, notice: 'Cpu was successfully updated.' }
        format.json { render :show, status: :ok, location: @cpu }
      else
        format.html { render :edit }
        format.json { render json: @cpu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpus/1
  # DELETE /cpus/1.json
  def destroy
    @cpu.destroy
    respond_to do |format|
      format.html { redirect_to cpus_url, notice: 'Cpu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cpu
      @cpu = Cpu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cpu_params
      params.require(:cpu).permit(:manufacturer, :model, :part_no, :data_width, :speed, :cores, :l1_cache, :l2_cache, :l3_cache, :lithography, :thermal_design_power, :includes_cpu_cooler, :hyper_threading, :integrated_graphics, :cpu_socket_id)
    end
end
