require 'test_helper'

class WorkshopsControllerTest < ActionController::TestCase
  setup do
    @workshop = workshops(:car_repair)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workshops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workshop" do
    assert_difference('Workshop.count') do
      post :create, :workshop => {:name => 'Songwriting', :start_at => '2011-03-12 12:00:00', :end_at => '2011-03-12 13:30:00', :room => rooms(:cafeteria)}
    end

    assert_redirected_to workshop_path(assigns(:workshop))
  end

  test "should not create workshop when room is not available" do
    assert_no_difference('Workshop.count') do
      post :create, :workshop => {:name => 'PHP Programming', :start_at => '2011-03-11 18:30:00', :end_at => '2011-03-11 18:45:00', :room => rooms(:cafeteria)}
    end
  end

  test "should show workshop" do
    get :show, :id => @workshop.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @workshop.to_param
    assert_response :success
  end

  test "should update workshop" do
    put :update, :id => @workshop.to_param, :workshop => @workshop.attributes
    assert_redirected_to workshop_path(assigns(:workshop))
  end

  test "should destroy workshop" do
    assert_difference('Workshop.count', -1) do
      delete :destroy, :id => @workshop.to_param
    end

    assert_redirected_to workshops_path
  end
end
