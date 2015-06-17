class Processor::MemoriesController < ApplicationController
  before_action :set_processor_memory, only: [:show, :edit, :update, :destroy]

  # GET /processor/memories
  # GET /processor/memories.json
  def index
    @processor_memories = Processor::Memory.all
  end

  # GET /processor/memories/1
  # GET /processor/memories/1.json
  def show
  end

  # GET /processor/memories/new
  def new
    @processor_memory = Processor::Memory.new
  end

  # GET /processor/memories/1/edit
  def edit
  end

  # POST /processor/memories
  # POST /processor/memories.json
  def create
    @processor_memory = Processor::Memory.new(processor_memory_params)

    respond_to do |format|
      if @processor_memory.save
        format.html { redirect_to @processor_memory, notice: 'Memory was successfully created.' }
        format.json { render :show, status: :created, location: @processor_memory }
      else
        format.html { render :new }
        format.json { render json: @processor_memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processor/memories/1
  # PATCH/PUT /processor/memories/1.json
  def update
    respond_to do |format|
      if @processor_memory.update(processor_memory_params)
        format.html { redirect_to @processor_memory, notice: 'Memory was successfully updated.' }
        format.json { render :show, status: :ok, location: @processor_memory }
      else
        format.html { render :edit }
        format.json { render json: @processor_memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processor/memories/1
  # DELETE /processor/memories/1.json
  def destroy
    @processor_memory.destroy
    respond_to do |format|
      format.html { redirect_to processor_memories_url, notice: 'Memory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processor_memory
      @processor_memory = Processor::Memory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processor_memory_params
      params.require(:processor_memory).permit(:max_memory_size_GB, :max_no_of_memory_channels, :max_memory_bandwidth_in_GBs, :ecc_memory_supported)
    end
end
