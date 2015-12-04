require 'test_helper'

class CourseOffersControllerTest < ActionController::TestCase
  setup do
    @course_offer = course_offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_offer" do
    assert_difference('CourseOffer.count') do
      post :create, course_offer: { course_id: @course_offer.course_id, semester_id: @course_offer.semester_id }
    end

    assert_redirected_to course_offer_path(assigns(:course_offer))
  end

  test "should show course_offer" do
    get :show, id: @course_offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_offer
    assert_response :success
  end

  test "should update course_offer" do
    patch :update, id: @course_offer, course_offer: { course_id: @course_offer.course_id, semester_id: @course_offer.semester_id }
    assert_redirected_to course_offer_path(assigns(:course_offer))
  end

  test "should destroy course_offer" do
    assert_difference('CourseOffer.count', -1) do
      delete :destroy, id: @course_offer
    end

    assert_redirected_to course_offers_path
  end
end
