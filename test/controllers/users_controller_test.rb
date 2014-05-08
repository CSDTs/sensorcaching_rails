require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end
  
  test 'should get index for JSON' do
    @request.headers['Accept'] = 'application/json'
    get :index
    
    assert_response :success
    assert_not_nil assigns(:users)
    assert_equal(@response.content_type, 'application/json')
  end
end
