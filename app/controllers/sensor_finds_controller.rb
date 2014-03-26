class SensorFindsController < ApplicationController
  include Combinedcrud
  load_and_authorize_resource
  before_action :set_sensor_find, only: [:show, :edit, :update, :destroy]

  # GET /sensor_finds/
  # GET /sensors_finds.json
  def index
    @sensor_finds = SensorFind.all
  end

  # GET /sensor_finds/1
  # GET /sensor_finds/1.json
  def show
  end
  
  # GET /sensor_finds/new
  def new
    @sensor_find = SensorFind.new
  end

  # GET /sensor_finds/1/edit
  def edit
  end

  # POST /sensor_finds
  # POST /sensor_finds.json
  def create
    @sensor_find = SensorFind.new(sensor_find_params)
    @sensor_find.user_id = current_user.id

    create_save(@sensor_find, "Sensor find")
  end

  # PATCH/PUT /sensor_finds/1
  # PATCH/PUT /sensor_finds/1.json
  def update
    update_save(@sensor_find, sensor_find_params, "Sensor find")
  end

  # DELETE /sensor_finds/1
  # DELETE /sensor_finds/1.json
  def destroy
    destroy_and_redirect(@sensor_find, sensor_finds_url)
  end
  
  # GET /sensor_finds_by_user/1
  def finds_by_user
    user_id = Integer(params[:user_id]) rescue false ? params[:user_id].to_i : @current_user.id
    @sensors = Sensor.where("user_id = ?", user_id)
    render 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor_find
      @sensor_find = SensorFind.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sensor_find_params
      params.require(:sensor_find).permit(:sensor_id, :time, :comments)
    end
end
