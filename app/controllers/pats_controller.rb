class PatsController < ApplicationController
  before_action :set_pat, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /pats
  # GET /pats.json
  def index
    @pats = Pat.all
  end
  
  def index
@pats = Pat.all
  if params[:search]
    @pats = Pat.search(params[:search]).order("created_at DESC")
  else
    @pats = Pat.all.order("created_at DESC")
  end
end
  

  # GET /pats/1
  # GET /pats/1.json
  def show
  end

  # GET /pats/new
  def new
    @pat = Pat.new
  end

  # GET /pats/1/edit
  def edit
  end

  # POST /pats
  # POST /pats.json
  def create
    @pat = Pat.new(pat_params)

    respond_to do |format|
      if @pat.save
        format.html { redirect_to @pat, notice: 'Pat was successfully created.' }
        format.json { render :show, status: :created, location: @pat }
      else
        format.html { render :new }
        format.json { render json: @pat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pats/1
  # PATCH/PUT /pats/1.json
  def update
    respond_to do |format|
      if @pat.update(pat_params)
        format.html { redirect_to @pat, notice: 'Pat was successfully updated.' }
        format.json { render :show, status: :ok, location: @pat }
      else
        format.html { render :edit }
        format.json { render json: @pat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pats/1
  # DELETE /pats/1.json
  def destroy
    @pat.destroy
    respond_to do |format|
      format.html { redirect_to pats_url, notice: 'Pat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pat
      @pat = Pat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pat_params
      params.require(:pat).permit(:name, :dob, :phone, :condition, :appointment)
    end
end
