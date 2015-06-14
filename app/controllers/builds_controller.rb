class BuildsController < ApplicationController
  before_action :set_build, only: [:show, :edit, :update, :destroy]

  # GET /builds
  # GET /builds.json
  def index
    @builds = Build.all
  end

  # GET /builds/1
  # GET /builds/1.json
  def show

    @build = Build.find(params[:id])
    
    @build.cpu.cpu_socket
    @build.motherboard.cpu_socket
    @build.cooler.cpu_sockets
    
    @consistancies,@conflicts = @build.concistency_check()


  end

  # GET /builds/new
  def new
    @build = Build.new
  end

  # GET /builds/1/edit
  def edit
  end

  # POST /builds
  # POST /builds.json
  def create
    @build = Build.new
    @build.cpu=Cpu.find_by_part_no(build_params[:cpu])
    @build.cooler=Cooler.find_by_part_no(build_params[:cooler]) 
    @build.motherboard=Motherboard.find_by_part_no(build_params[:motherboard])
    @build.memory=Memory.find_by_part_no(build_params[:memory]) 

    respond_to do |format|
      if @build.save
        format.html { redirect_to @build, notice: 'Build was successfully created.' }
        format.json { render :show, status: :created, location: @build }
      else
        format.html { render :new }
        format.json { render json: @build.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /builds/1
  # PATCH/PUT /builds/1.json
  def update
    respond_to do |format|
      if @build.update(build_params)
        format.html { redirect_to @build, notice: 'Build was successfully updated.' }
        format.json { render :show, status: :ok, location: @build }
      else
        format.html { render :edit }
        format.json { render json: @build.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /builds/1
  # DELETE /builds/1.json
  def destroy
    @build.destroy
    respond_to do |format|
      format.html { redirect_to builds_url, notice: 'Build was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_build
      @build = Build.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def build_params
      params.require(:build).permit(:cpu, :motherboard, :cooler, :memory)
    end
end
