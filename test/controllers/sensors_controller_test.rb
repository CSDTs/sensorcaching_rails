require 'test_helper'

class SensorsControllerTest < ActionController::TestCase
  setup do
    @sensor = sensors(:sensor_one)
    @u1 = users(:user_one)
    sign_in @u1
    
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sensors)
  end
  
  test "should get index for JSON" do
    @request.headers["Accept"] = "application/json"
    get :index
    
    assert_response :success
    assert_not_nil assigns(:sensors)
    assert_equal(@response.content_type, "application/json")
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sensor" do
    assert_difference('Sensor.count') do
      post :create, sensor: { description: @sensor.description, name: @sensor.name , latitude: @sensor.latitude, longitude: @sensor.longitude, sensor_type_id: @sensor.sensor_type.id}
    end

    assert_redirected_to sensor_path(assigns(:sensor))
    assert_not_nil assigns(:sensor)
  end

  test "should show sensor" do
    get :show, id: @sensor
    assert_response :success
    assert_not_nil assigns(:sensor)
    assert_equal(@sensor.id, assigns(:sensor).id)
  end

  test "should get edit" do
    get :edit, id: @sensor
    assert_response :success
    assert_not_nil assigns(:sensor)
    assert_equal(@sensor.id, assigns(:sensor).id)
  end

  test "should update sensor" do
    patch :update, id: @sensor, sensor: { description: @sensor.description, name: @sensor.name }
    assert_redirected_to sensor_path(assigns(:sensor))
  end

  test "should destroy sensor" do
    assert_difference('Sensor.count', -1) do
      delete :destroy, id: @sensor
    end

    assert_redirected_to sensors_path
  end
  
  test "should succeed in returning sensors near me" do
    get "sensors_near_me"
    assert_response :success
    assert_not_nil assigns(:sensors) 
  end
  
  test "should succeed in returning sensors for a type" do
    get "sensors_by_type", type: :light
    assert_response :success
    assert_not_nil assigns(:sensors)
  end
  
  test "should succeed in returning sensors for the current user" do
    get "sensors_by_user"
    assert_response :success
    assert_not_nil assigns(:sensors)
    assigns(:sensors).each do |sensor|
      assert_equal(@u1.id, sensor.user_id)
    end
  end
  
  test "should succeed in returning sensors for a different user" do
    get "sensors_by_user", user_id: users(:user_two).id
    assert_response :success
    assert_not_nil assigns(:sensors)
    assigns(:sensors).each do |sensor|
      assert_equal(users(:user_two).id, sensor.user_id)
    end
  end
  
  test "should ignore an ID that is not an int (and still work)" do
    get "sensors_by_user", user_id: "asdf"
    assert_response :success
    assert_not_nil assigns(:sensors)
  end
  
end
