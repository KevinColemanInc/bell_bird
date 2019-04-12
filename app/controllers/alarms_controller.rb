class AlarmsController < ApplicationController
  before_action :set_alarm, only: [:show, :edit, :update, :destroy]

  # GET /alarms
  # GET /alarms.json
  def index
    @alarms = Alarm.ordered

    @alarms = @alarms.sort { |x,y| y.score <=> x.score }
  end

  # GET /alarms/1
  # GET /alarms/1.json
  def show
  end

  # GET /alarms/new
  def new
    @alarm = Alarm.new
  end

  # GET /alarms/1/edit
  def edit
  end

  # POST /alarms
  # POST /alarms.json
  def create
    builder = Alarms::Create.new(params.require(:alarm).permit(:description))
    @alarm = builder.perform

    respond_to do |format|
      if @alarm.save
        format.html { redirect_to @alarm, notice: 'Alarm was successfully created.' }
        format.json { render :show, status: :created, location: @alarm }
      else
        format.html { render :new }
        format.json { render json: @alarm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alarms/1
  # PATCH/PUT /alarms/1.json
  def update
    Alarms::Update.new(@alarm, alarm_params).perform

    respond_to do |format|
      if @alarm.valid?
        format.html { redirect_to alarms_path, notice: 'Alarm was successfully updated.' }
        format.json { render :show, status: :ok, location: @alarm }
      else
        format.html { render :edit }
        format.json { render json: @alarm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alarms/1
  # DELETE /alarms/1.json
  def destroy
    @alarm.destroy
    respond_to do |format|
      format.html { redirect_to alarms_url, notice: 'Alarm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alarm
      @alarm = Alarm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alarm_params
      params.require(:alarm).permit(:description, :up)
    end
end
