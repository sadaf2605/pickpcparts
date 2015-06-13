class CpuSocketsController < ApplicationController
  before_action :set_cpu_socket, only: [:show, :edit, :update, :destroy]

  # GET /cpu_sockets
  # GET /cpu_sockets.json
  def index
    @cpu_sockets = CpuSocket.all
  end

  # GET /cpu_sockets/1
  # GET /cpu_sockets/1.json
  def show
  end

  # GET /cpu_sockets/new
  def new
    @cpu_socket = CpuSocket.new
  end

  # GET /cpu_sockets/1/edit
  def edit
  end

  # POST /cpu_sockets
  # POST /cpu_sockets.json
  def create
    @cpu_socket = CpuSocket.new(cpu_socket_params)

    respond_to do |format|
      if @cpu_socket.save
        format.html { redirect_to @cpu_socket, notice: 'Cpu socket was successfully created.' }
        format.json { render :show, status: :created, location: @cpu_socket }
      else
        format.html { render :new }
        format.json { render json: @cpu_socket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cpu_sockets/1
  # PATCH/PUT /cpu_sockets/1.json
  def update
    respond_to do |format|
      if @cpu_socket.update(cpu_socket_params)
        format.html { redirect_to @cpu_socket, notice: 'Cpu socket was successfully updated.' }
        format.json { render :show, status: :ok, location: @cpu_socket }
      else
        format.html { render :edit }
        format.json { render json: @cpu_socket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpu_sockets/1
  # DELETE /cpu_sockets/1.json
  def destroy
    @cpu_socket.destroy
    respond_to do |format|
      format.html { redirect_to cpu_sockets_url, notice: 'Cpu socket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cpu_socket
      @cpu_socket = CpuSocket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cpu_socket_params
      params.require(:cpu_socket).permit(:name)
    end
end
