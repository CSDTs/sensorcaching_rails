require 'test_helper'

class SensorDataControllerTest < ActionController::TestCase
  setup do
    @sensor_datum = sensor_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sensor_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sensor_datum" do
    assert_difference('SensorDatum.count') do
      post :create, sensor_datum: { data: @sensor_datum.data, sensor_id: @sensor_datum.sensor_id, timestamp: @sensor_datum.timestamp }
    end

    assert_redirected_to sensor_datum_path(assigns(:sensor_datum))
  end

  test "should show sensor_datum" do
    get :show, id: @sensor_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sensor_datum
    assert_response :success
  end

  test "should update sensor_datum" do
    patch :update, id: @sensor_datum, sensor_datum: { data: @sensor_datum.data, sensor_id: @sensor_datum.sensor_id, timestamp: @sensor_datum.timestamp }
    assert_redirected_to sensor_datum_path(assigns(:sensor_datum))
  end

  test "should destroy sensor_datum" do
    assert_difference('SensorDatum.count', -1) do
      delete :destroy, id: @sensor_datum
    end

    assert_redirected_to sensor_data_path
  end
end
