class ShiftsController < ApplicationController
  require 'shift_decorator'
  
  before_action :set_shift, only: [:show, :edit, :update, :destroy]
  
  # GET /shifts
  # GET /shifts.json
  def index
    @shifts = Shift.all
  end

  # GET /shifts/1
  # GET /shifts/1.json
  def show
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # GET /shifts/1/edit
  def edit
  end
  
  
  
  
   def create
            @shift = Shift.new()
            @shift.firstname = params[:shift][:firstname]
            @shift.lastname = params[:shift][:lastname]
            @shift.color = params[:shift][:color]
            @shift.firm = params[:shift][:firm]
            # create an instance/object of a BasicShift
myShift = BasicShift.new(10, @shift.firm, @shift.color)
            # add the extra features to the new car
            if params[:shift][:windows].to_s.length > 0 then
                myShift = ElectricWindowsDecorator.new(myShift)
            end
            
                        if params[:shift][:ctscan].to_s.length > 0 then
                myShift = CtscanDecorator.new(myShift)
            end
            
            
                        if params[:shift][:endoscopy].to_s.length > 0 then
                myShift = EndoscopyDecorator.new(myShift)
            end
  
  
              
                        if params[:shift][:card].to_s.length > 0 then
                myShift = CardDecorator.new(myShift)
            end
  
            ## populate the cost and the description details
            @shift.cost = myShift.cost
            @shift.description = myShift.details
            respond_to do |format|
              if @shift.save
        format.html { redirect_to @shift, notice: 'Shift was successfully created.'}
                format.json { render :show, status: :created, location: @shift }
              else
                format.html { render :new }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
              end
end
end

  

  # PATCH/PUT /shifts/1
  # PATCH/PUT /shifts/1.json
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to shifts_url, notice: 'Shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_params
      params.require(:shift).permit(:firstname, :lastname, :shift, :cost, :description, :color)
    end
end
