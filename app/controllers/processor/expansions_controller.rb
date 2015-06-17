class Processor::ExpansionsController < ApplicationController
  before_action :set_processor_expansion, only: [:show, :edit, :update, :destroy]

  # GET /processor/expansions
  # GET /processor/expansions.json
  def index
    @processor_expansions = Processor::Expansion.all
  end

  # GET /processor/expansions/1
  # GET /processor/expansions/1.json
  def show
  end

  # GET /processor/expansions/new
  def new
    @processor_expansion = Processor::Expansion.new
  end

  # GET /processor/expansions/1/edit
  def edit
  end

  # POST /processor/expansions
  # POST /processor/expansions.json
  def create
    @processor_expansion = Processor::Expansion.new(processor_expansion_params)

    respond_to do |format|
      if @processor_expansion.save
        format.html { redirect_to @processor_expansion, notice: 'Expansion was successfully created.' }
        format.json { render :show, status: :created, location: @processor_expansion }
      else
        format.html { render :new }
        format.json { render json: @processor_expansion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processor/expansions/1
  # PATCH/PUT /processor/expansions/1.json
  def update
    respond_to do |format|
      if @processor_expansion.update(processor_expansion_params)
        format.html { redirect_to @processor_expansion, notice: 'Expansion was successfully updated.' }
        format.json { render :show, status: :ok, location: @processor_expansion }
      else
        format.html { render :edit }
        format.json { render json: @processor_expansion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processor/expansions/1
  # DELETE /processor/expansions/1.json
  def destroy
    @processor_expansion.destroy
    respond_to do |format|
      format.html { redirect_to processor_expansions_url, notice: 'Expansion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processor_expansion
      @processor_expansion = Processor::Expansion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processor_expansion_params
      params.require(:processor_expansion).permit(:PCI_express_revision, :max_no_of_PCI_express_lanes)
    end
end
