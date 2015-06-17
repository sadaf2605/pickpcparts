class Processor::PerformancesController < ApplicationController
  before_action :set_processor_performance, only: [:show, :edit, :update, :destroy]

  # GET /processor/performances
  # GET /processor/performances.json
  def index
    @processor_performances = Processor::Performance.all
  end

  # GET /processor/performances/1
  # GET /processor/performances/1.json
  def show
  end

  # GET /processor/performances/new
  def new
    @processor_performance = Processor::Performance.new
  end

  # GET /processor/performances/1/edit
  def edit
  end

  # POST /processor/performances
  # POST /processor/performances.json
  def create
    @processor_performance = Processor::Performance.new(processor_performance_params)

    respond_to do |format|
      if @processor_performance.save
        format.html { redirect_to @processor_performance, notice: 'Performance was successfully created.' }
        format.json { render :show, status: :created, location: @processor_performance }
      else
        format.html { render :new }
        format.json { render json: @processor_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processor/performances/1
  # PATCH/PUT /processor/performances/1.json
  def update
    respond_to do |format|
      if @processor_performance.update(processor_performance_params)
        format.html { redirect_to @processor_performance, notice: 'Performance was successfully updated.' }
        format.json { render :show, status: :ok, location: @processor_performance }
      else
        format.html { render :edit }
        format.json { render json: @processor_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processor/performances/1
  # DELETE /processor/performances/1.json
  def destroy
    @processor_performance.destroy
    respond_to do |format|
      format.html { redirect_to processor_performances_url, notice: 'Performance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processor_performance
      @processor_performance = Processor::Performance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processor_performance_params
      params.require(:processor_performance).permit(:no_of_cores, :no_of_threads, :processor_base_frequency_in_GHz, :thermal_design_power_in_W)
    end
end
