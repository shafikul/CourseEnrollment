require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get Index" do
    get :Index
    assert_response :success
  end

  test "should get Home" do
    get :Home
    assert_response :success
  end

  test "should get Profile" do
    get :Profile
    assert_response :success
  end

  test "should get Explore" do
    get :Explore
    assert_response :success
  end

end
