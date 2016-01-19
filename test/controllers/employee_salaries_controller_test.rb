require 'test_helper'

class EmployeeSalariesControllerTest < ActionController::TestCase
  setup do
    @employee_salary = employee_salaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_salaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_salary" do
    assert_difference('EmployeeSalary.count') do
      post :create, employee_salary: { employee_id: @employee_salary.employee_id, salary_date: @employee_salary.salary_date, salary_structure_id: @employee_salary.salary_structure_id }
    end

    assert_redirected_to employee_salary_path(assigns(:employee_salary))
  end

  test "should show employee_salary" do
    get :show, id: @employee_salary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_salary
    assert_response :success
  end

  test "should update employee_salary" do
    patch :update, id: @employee_salary, employee_salary: { employee_id: @employee_salary.employee_id, salary_date: @employee_salary.salary_date, salary_structure_id: @employee_salary.salary_structure_id }
    assert_redirected_to employee_salary_path(assigns(:employee_salary))
  end

  test "should destroy employee_salary" do
    assert_difference('EmployeeSalary.count', -1) do
      delete :destroy, id: @employee_salary
    end

    assert_redirected_to employee_salaries_path
  end
end
