class SensorTypesController < ApplicationController
  include Combinedcrud
  load_and_authorize_resource
  before_action :set_sensor_type, only: [:show, :edit, :update, :destroy]

  # GET /sensor_types
  # GET /sensor_types.json
  def index
    @sensor_types = SensorType.all
  end

  # GET /sensor_types/1
  # GET /sensor_types/1.json
  def show
  end

  # GET /sensor_types/new
  def new
    @sensor_type = SensorType.new
  end

  # GET /sensor_types/1/edit
  def edit
  end

  # POST /sensor_types
  # POST /sensor_types.json
  def create
    @sensor_type = SensorType.new(sensor_type_params)
    
    create_save(@sensor_type, "Sensor type")
  end

  # PATCH/PUT /sensor_types/1
  # PATCH/PUT /sensor_types/1.json
  def update
    update_save(@sensor_type, sensor_type_params, "Sensor type")
  end

  # DELETE /sensor_types/1
  # DELETE /sensor_types/1.json
  def destroy
    destroy_and_redirect(@sensor_type, sensor_types_url)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor_type
      @sensor_type = SensorType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sensor_type_params
      params.require(:sensor_type).permit(:name)
    end
end
