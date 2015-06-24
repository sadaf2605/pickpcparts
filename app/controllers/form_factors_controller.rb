class FormFactorsController < ApplicationController
  before_action :set_form_factor, only: [:show, :edit, :update, :destroy]

  # GET /form_factors
  # GET /form_factors.json
  def index
    @form_factors = FormFactor.all
  end

  # GET /form_factors/1
  # GET /form_factors/1.json
  def show
  end

  # GET /form_factors/new
  def new
    @form_factor = FormFactor.new
  end

  # GET /form_factors/1/edit
  def edit
  end

  # POST /form_factors
  # POST /form_factors.json
  def create
    @form_factor = FormFactor.new(form_factor_params)

    respond_to do |format|
      if @form_factor.save
        format.html { redirect_to @form_factor, notice: 'Form factor was successfully created.' }
        format.json { render :show, status: :created, location: @form_factor }
      else
        format.html { render :new }
        format.json { render json: @form_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_factors/1
  # PATCH/PUT /form_factors/1.json
  def update
    respond_to do |format|
      if @form_factor.update(form_factor_params)
        format.html { redirect_to @form_factor, notice: 'Form factor was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_factor }
      else
        format.html { render :edit }
        format.json { render json: @form_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_factors/1
  # DELETE /form_factors/1.json
  def destroy
    @form_factor.destroy
    respond_to do |format|
      format.html { redirect_to form_factors_url, notice: 'Form factor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_factor
      @form_factor = FormFactor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_factor_params
      params.require(:form_factor).permit(:string)
    end
end
