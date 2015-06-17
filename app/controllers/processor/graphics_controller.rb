class Processor::GraphicsController < ApplicationController
  before_action :set_processor_graphic, only: [:show, :edit, :update, :destroy]

  # GET /processor/graphics
  # GET /processor/graphics.json
  def index
    @processor_graphics = Processor::Graphic.all
  end

  # GET /processor/graphics/1
  # GET /processor/graphics/1.json
  def show
  end

  # GET /processor/graphics/new
  def new
    @processor_graphic = Processor::Graphic.new
  end

  # GET /processor/graphics/1/edit
  def edit
  end

  # POST /processor/graphics
  # POST /processor/graphics.json
  def create
    @processor_graphic = Processor::Graphic.new(processor_graphic_params)

    respond_to do |format|
      if @processor_graphic.save
        format.html { redirect_to @processor_graphic, notice: 'Graphic was successfully created.' }
        format.json { render :show, status: :created, location: @processor_graphic }
      else
        format.html { render :new }
        format.json { render json: @processor_graphic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processor/graphics/1
  # PATCH/PUT /processor/graphics/1.json
  def update
    respond_to do |format|
      if @processor_graphic.update(processor_graphic_params)
        format.html { redirect_to @processor_graphic, notice: 'Graphic was successfully updated.' }
        format.json { render :show, status: :ok, location: @processor_graphic }
      else
        format.html { render :edit }
        format.json { render json: @processor_graphic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processor/graphics/1
  # DELETE /processor/graphics/1.json
  def destroy
    @processor_graphic.destroy
    respond_to do |format|
      format.html { redirect_to processor_graphics_url, notice: 'Graphic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processor_graphic
      @processor_graphic = Processor::Graphic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processor_graphic_params
      params.require(:processor_graphic).permit(:processor_graphics, :graphics_base_frequency_in_MHz, :graphics_max_dynamic_frequency_GHz, :graphics_video_max_memory_in_GB, :quick_sync_video, :wireless_display, :clear_video_hd_technology)
    end
end
