class BuildsController < ApplicationController
  before_action :set_build, only: [:show, :edit, :update, :destroy]




  def current_build
    @current_build = get_current_build()
  end





  # GET /builds
  # GET /builds.json
  def index
    @builds = Build.all
  end
  
  def front
    def page_number
      @page_number ||= params[Kaminari.config.param_name]
    end
    
    @feat_posts = FeaturedPost.singleton_instance.blog_posts
    @week_post ||= Blogit::Post.for_index.first(1)[0]
    
    @build = Build.all[0]
        
  end
  
  layout "front_page"
  def token_build
    @current_build=Build.find_by_token(params[:token])
    respond_to do |format|
      format.html { render :template => "builds/current_build" }
    end

  end


  def action_missing(m, *args, &block)
    if m.starts_with? "add_"
      k=(m.split "_") [1]
      @current_build = get_current_build
      qty=params[:qty]      
      Integer(qty).times do
        build= (Object.const_get "#{k.capitalize}Build").create({(k+"_id").to_sym => params[(k+"_id").to_sym], :market_status_id => params[:market_status]})
        eval("@current_build.#{k}_builds << build")
      end
      redirect_to current_build_url
    elsif m.starts_with? "remove_"
      k=(m.split "_") [1]
      @current_build = get_current_build
      p=(Object.const_get "#{k.capitalize}") .find(params[("#{k}_id").to_sym])
      @current_build.send("remove_#{k}",p)
      redirect_to current_build_url
    else
      super
    end
    
  end



  
  def remove_cpu
    @current_build = get_current_build
    cpu=Cpu.find(params[:cpu_id])
    @current_build.remove_cpu(cpu)
    redirect_to current_build_url
  end



  def remove_motherboard
    @current_build = get_current_build
    motherboard = Motherboard.find(params[:motherboard_id])
    @current_build.remove_motherboard(motherboard)
    redirect_to current_build_url
  end
  
  

  
  def remove_cooler
    @current_build = get_current_build
    cooler = Cooler.find(params[:cooler_id])
    @current_build.remove_cooler(cooler)
    redirect_to current_build_url
  end

  def remove_memory
    @current_build =get_current_build
    memory = Memory.find(params[:memory_id])
    @current_build.remove_memory(memory)
    redirect_to current_build_url
  end
   
  

  def remove_storage
    @current_build =get_current_build
    storage = Storage.find(params[:storage_id])
    @current_build.remove_storage(storage)
    redirect_to current_build_url
  end


  def remove_video_card
    @current_build =get_current_build
    video_card = VideoCard.find(params[:video_card_id])
    @current_build.remove_video_card(video_card)
    redirect_to current_build_url
  end


  def remove_cpu_case
    @current_build =get_current_build
    cpu_case = CpuCase.find(params[:cpu_case_id])
    @current_build.remove_cpu_case(cpu_case)
    redirect_to current_build_url

  end
  

    def remove_power_supply
    @current_build =get_current_build
    power_supply = PowerSupply.find(params[:power_supply_id])
    @current_build.remove_power_supply(power_supply)
    redirect_to current_build_url
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
    builds = Build.find_by_token(session[:build_token])
    if not builds
      build=Build.create
      build.token=rand(36**8).to_s(36)
      session[:build_token]=build.token
      build.save
      return build
    end
    return builds
  end



end


