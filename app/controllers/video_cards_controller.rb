class VideoCardsController < ApplicationController
  before_action :set_video_card, only: [:show, :edit, :update, :destroy]

  # GET /video_cards
  # GET /video_cards.json
  def index
    @video_cards = VideoCard.all
  end

  # GET /video_cards/1
  # GET /video_cards/1.json
  def show
  end

  # GET /video_cards/new
  def new
    @video_card = VideoCard.new
  end

  # GET /video_cards/1/edit
  def edit
  end

  # POST /video_cards
  # POST /video_cards.json
  def create
    @video_card = VideoCard.new(video_card_params)

    respond_to do |format|
      if @video_card.save
        format.html { redirect_to @video_card, notice: 'Video card was successfully created.' }
        format.json { render :show, status: :created, location: @video_card }
      else
        format.html { render :new }
        format.json { render json: @video_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /video_cards/1
  # PATCH/PUT /video_cards/1.json
  def update
    respond_to do |format|
      if @video_card.update(video_card_params)
        format.html { redirect_to @video_card, notice: 'Video card was successfully updated.' }
        format.json { render :show, status: :ok, location: @video_card }
      else
        format.html { render :edit }
        format.json { render json: @video_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_cards/1
  # DELETE /video_cards/1.json
  def destroy
    @video_card.destroy
    respond_to do |format|
      format.html { redirect_to video_cards_url, notice: 'Video card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_card
      @video_card = VideoCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_card_params
      params.require(:video_card).permit(:manufacturer, :part_no, :interface, :chipset, :memory_size, :memory_type, :core_clock, :tdp, :fan, :sli_support, :crossfire_support, :length, :dvi_d_dual_link, :display_port, :hdmi)
    end
end
