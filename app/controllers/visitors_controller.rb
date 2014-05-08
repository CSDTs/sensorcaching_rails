class VisitorsController < ApplicationController
  helper SensorsHelper
  
  def new
    @sensors = Sensor.all
  end
end

