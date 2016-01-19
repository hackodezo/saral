require 'test_helper'

class LeaveEmployeesControllerTest < ActionController::TestCase
  setup do
    @leave_employee = leave_employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_employee" do
    assert_difference('LeaveEmployee.count') do
      post :create, leave_employee: { head_values: @leave_employee.head_values, leave_allot_id: @leave_employee.leave_allot_id }
    end

    assert_redirected_to leave_employee_path(assigns(:leave_employee))
  end

  test "should show leave_employee" do
    get :show, id: @leave_employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leave_employee
    assert_response :success
  end

  test "should update leave_employee" do
    patch :update, id: @leave_employee, leave_employee: { head_values: @leave_employee.head_values, leave_allot_id: @leave_employee.leave_allot_id }
    assert_redirected_to leave_employee_path(assigns(:leave_employee))
  end

  test "should destroy leave_employee" do
    assert_difference('LeaveEmployee.count', -1) do
      delete :destroy, id: @leave_employee
    end

    assert_redirected_to leave_employees_path
  end
end
