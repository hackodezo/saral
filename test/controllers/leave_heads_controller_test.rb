require 'test_helper'

class LeaveHeadsControllerTest < ActionController::TestCase
  setup do
    @leave_head = leave_heads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_heads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_head" do
    assert_difference('LeaveHead.count') do
      post :create, leave_head: { name: @leave_head.name }
    end

    assert_redirected_to leave_head_path(assigns(:leave_head))
  end

  test "should show leave_head" do
    get :show, id: @leave_head
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leave_head
    assert_response :success
  end

  test "should update leave_head" do
    patch :update, id: @leave_head, leave_head: { name: @leave_head.name }
    assert_redirected_to leave_head_path(assigns(:leave_head))
  end

  test "should destroy leave_head" do
    assert_difference('LeaveHead.count', -1) do
      delete :destroy, id: @leave_head
    end

    assert_redirected_to leave_heads_path
  end
end
