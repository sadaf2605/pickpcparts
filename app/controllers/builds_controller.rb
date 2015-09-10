class BuildsController < ApplicationController
  before_action :set_build, only: [:show, :edit, :update, :destroy]
  layout "front_page"



  def current_build
    @current_build = get_current_build()
    respond_to do |format|
      format.html
    end
  end





  # GET /builds
  # GET /builds.json
  def index
    @builds = Build.all
  end
 
  

  def token_build
    @current_build=Build.find_by_token(params[:token])
    respond_to do |format|
      format.html { render :template => "builds/current_build" }
      format.pdf {
        html = render_to_string(:layout => false , :action => "current_build.pdf.erb")
        kit = PDFKit.new(html)
  #      kit.stylesheets << "#{Rails.root}/public/stylesheets/pdf.css"
  #      logger.debug kit
        send_data(kit.to_pdf, :filename=>"pcpartsbd-#{@current_build}.pdf",
          :type => 'application/pdf', :disposition => 'inline')
    }

    end

  end


  def action_missing(m, *args, &block)
    if m.include? "_"
  
      current_build = get_current_build()
      k=(m.split "_", 2) [1]  

      if m.starts_with? "add_"
        qty=params[:qty]        
        Integer(qty).times do
          add(current_build, k)
        end
      elsif m.starts_with? "remove_"
        remove(current_build, k)
      end

      session[:build_token]=current_build.token
      redirect_to current_build_url
    
    else
      super
    end

  end

  def add(build,k)
    part= (Object.const_get "#{k.camelize}Build").create({(k+"_id").to_sym => params[(k+"_id").to_sym], :market_status_id => params[:market_status]})
    build.send("add_#{k}",part)
  end

  def remove(build,k)
    p=(Object.const_get "#{k.camelize}") .find(params[("#{k}_id").to_sym])
    build.send("remove_#{k}",p)
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
    @build.storage=Memory.find_by_part_no(build_params[:storage])
    @build.video_card=Memory.find_by_part_no(build_params[:video_card]) 

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
      params.require(:build).permit(:cpu, :motherboard, :cooler, :memory, :storage,:video_card)
    end

  private
  def get_current_build
    build = Build.find_by_token(session[:build_token])
    if not build
      build=Build.new
      build.token=rand(36**8).to_s(36)
      return build
    end
    return build
  end



end


