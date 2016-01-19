require 'test_helper'

class LeaveStructuresControllerTest < ActionController::TestCase
  setup do
    @leave_structure = leave_structures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_structures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_structure" do
    assert_difference('LeaveStructure.count') do
      post :create, leave_structure: { name: @leave_structure.name }
    end

    assert_redirected_to leave_structure_path(assigns(:leave_structure))
  end

  test "should show leave_structure" do
    get :show, id: @leave_structure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leave_structure
    assert_response :success
  end

  test "should update leave_structure" do
    patch :update, id: @leave_structure, leave_structure: { name: @leave_structure.name }
    assert_redirected_to leave_structure_path(assigns(:leave_structure))
  end

  test "should destroy leave_structure" do
    assert_difference('LeaveStructure.count', -1) do
      delete :destroy, id: @leave_structure
    end

    assert_redirected_to leave_structures_path
  end
end
