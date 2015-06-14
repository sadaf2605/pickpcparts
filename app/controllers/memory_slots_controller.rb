class MemorySlotsController < ApplicationController
  before_action :set_memory_slot, only: [:show, :edit, :update, :destroy]

  # GET /memory_slots
  # GET /memory_slots.json
  def index
    @memory_slots = MemorySlot.all
  end

  # GET /memory_slots/1
  # GET /memory_slots/1.json
  def show
  end

  # GET /memory_slots/new
  def new
    @memory_slot = MemorySlot.new
  end

  # GET /memory_slots/1/edit
  def edit
  end

  # POST /memory_slots
  # POST /memory_slots.json
  def create
    @memory_slot = MemorySlot.new(memory_slot_params)

    respond_to do |format|
      if @memory_slot.save
        format.html { redirect_to @memory_slot, notice: 'Memory slot was successfully created.' }
        format.json { render :show, status: :created, location: @memory_slot }
      else
        format.html { render :new }
        format.json { render json: @memory_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memory_slots/1
  # PATCH/PUT /memory_slots/1.json
  def update
    respond_to do |format|
      if @memory_slot.update(memory_slot_params)
        format.html { redirect_to @memory_slot, notice: 'Memory slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @memory_slot }
      else
        format.html { render :edit }
        format.json { render json: @memory_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memory_slots/1
  # DELETE /memory_slots/1.json
  def destroy
    @memory_slot.destroy
    respond_to do |format|
      format.html { redirect_to memory_slots_url, notice: 'Memory slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memory_slot
      @memory_slot = MemorySlot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memory_slot_params
      params.require(:memory_slot).permit(:name)
    end
end
