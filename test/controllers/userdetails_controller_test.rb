require 'test_helper'

class UserdetailsControllerTest < ActionController::TestCase
  setup do
    @userdetail = userdetails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userdetails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userdetail" do
    assert_difference('Userdetail.count') do
      post :create, userdetail: { city: @userdetail.city, contact_no: @userdetail.contact_no, country: @userdetail.country, line1: @userdetail.line1, line2: @userdetail.line2, state: @userdetail.state, user_id: @userdetail.user_id, zip: @userdetail.zip }
    end

    assert_redirected_to userdetail_path(assigns(:userdetail))
  end

  test "should show userdetail" do
    get :show, id: @userdetail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @userdetail
    assert_response :success
  end

  test "should update userdetail" do
    patch :update, id: @userdetail, userdetail: { city: @userdetail.city, contact_no: @userdetail.contact_no, country: @userdetail.country, line1: @userdetail.line1, line2: @userdetail.line2, state: @userdetail.state, user_id: @userdetail.user_id, zip: @userdetail.zip }
    assert_redirected_to userdetail_path(assigns(:userdetail))
  end

  test "should destroy userdetail" do
    assert_difference('Userdetail.count', -1) do
      delete :destroy, id: @userdetail
    end

    assert_redirected_to userdetails_path
  end
end
