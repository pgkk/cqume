require 'test_helper'

class CinemaControllerTest < ActionController::TestCase
  
  
  #初始化几个实例变量
  def setup
    @action=BookController.new
    @request=ActionController::TestRequest.new
    @response=ActionController::TestResponse.new
  end
  
  test "index" do
    get :index
    assert_response :success
  end
  
  
  
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
