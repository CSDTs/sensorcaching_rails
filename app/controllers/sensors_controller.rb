class SensorsController < ApplicationController
  include Combinedcrud
  load_and_authorize_resource
  before_action :set_sensor, only: [:show, :edit, :update, :destroy]

  # GET /sensors
  # GET /sensors.json
  def index
    @sensors = Sensor.all
  end

  # GET /sensors/1
  # GET /sensors/1.json
  def show
  end
  
  # GET /sensors/new
  def new
    @sensor = Sensor.new
  end

  # GET /sensors/1/edit
  def edit
  end

  # POST /sensors
  # POST /sensors.json
  def create
    @sensor = Sensor.new(sensor_params)
    @sensor.user_id = current_user.id

    create_save(@sensor, "Sensor")
  end

  # PATCH/PUT /sensors/1
  # PATCH/PUT /sensors/1.json
  def update
    update_save(@sensor, sensor_params, "Sensor")
  end

  # DELETE /sensors/1
  # DELETE /sensors/1.json
  def destroy
    destroy_and_redirect(@sensor, sensors_url)
  end
  
  # GET /sensors_by_user/1
  def sensors_by_user
    user_id = Integer(params[:user_id]) rescue false ? params[:user_id].to_i : @current_user.id
    @sensors = Sensor.where("user_id = ?", user_id)
    render 'index'
  end
  
  # GET /sensors_near_me/(optional number of miles)
  def sensors_near_me
    dist = Integer(params[:dist]) rescue false ? params[:dist].to_i : 15
    @sensors = Sensor.near(current_user, dist)
    @distance = true
    render 'index'
  end
  
  def sensors_by_type
    if can? :index, @sensor
      @sensors = Sensor.where("sensor_type_id = ?", params[:type])
      render 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor
      @sensor = Sensor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sensor_params
      params.require(:sensor).permit(:name, :description, :sensor_type_id, :latitude, :longitude)
    end
end
