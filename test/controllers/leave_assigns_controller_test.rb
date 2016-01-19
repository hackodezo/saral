require 'test_helper'

class LeaveAssignsControllerTest < ActionController::TestCase
  setup do
    @leave_assign = leave_assigns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_assigns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_assign" do
    assert_difference('LeaveAssign.count') do
      post :create, leave_assign: { leave_head_id: @leave_assign.leave_head_id, leave_structure_id: @leave_assign.leave_structure_id }
    end

    assert_redirected_to leave_assign_path(assigns(:leave_assign))
  end

  test "should show leave_assign" do
    get :show, id: @leave_assign
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leave_assign
    assert_response :success
  end

  test "should update leave_assign" do
    patch :update, id: @leave_assign, leave_assign: { leave_head_id: @leave_assign.leave_head_id, leave_structure_id: @leave_assign.leave_structure_id }
    assert_redirected_to leave_assign_path(assigns(:leave_assign))
  end

  test "should destroy leave_assign" do
    assert_difference('LeaveAssign.count', -1) do
      delete :destroy, id: @leave_assign
    end

    assert_redirected_to leave_assigns_path
  end
end
