require 'test_helper'

class LeaveAllotsControllerTest < ActionController::TestCase
  setup do
    @leave_allot = leave_allots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_allots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_allot" do
    assert_difference('LeaveAllot.count') do
      post :create, leave_allot: { employee_id: @leave_allot.employee_id, leave_structure_id: @leave_allot.leave_structure_id }
    end

    assert_redirected_to leave_allot_path(assigns(:leave_allot))
  end

  test "should show leave_allot" do
    get :show, id: @leave_allot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leave_allot
    assert_response :success
  end

  test "should update leave_allot" do
    patch :update, id: @leave_allot, leave_allot: { employee_id: @leave_allot.employee_id, leave_structure_id: @leave_allot.leave_structure_id }
    assert_redirected_to leave_allot_path(assigns(:leave_allot))
  end

  test "should destroy leave_allot" do
    assert_difference('LeaveAllot.count', -1) do
      delete :destroy, id: @leave_allot
    end

    assert_redirected_to leave_allots_path
  end
end
