require 'test_helper'

class SalaryStructuresControllerTest < ActionController::TestCase
  setup do
    @salary_structure = salary_structures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_structures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_structure" do
    assert_difference('SalaryStructure.count') do
      post :create, salary_structure: { basic: @salary_structure.basic, conveyance: @salary_structure.conveyance, da: @salary_structure.da, emp_pf: @salary_structure.emp_pf, gratuity: @salary_structure.gratuity, gross: @salary_structure.gross, hra: @salary_structure.hra, monthly_ctc: @salary_structure.monthly_ctc, name: @salary_structure.name, others: @salary_structure.others, pf: @salary_structure.pf, pt: @salary_structure.pt, special_allowance: @salary_structure.special_allowance }
    end

    assert_redirected_to salary_structure_path(assigns(:salary_structure))
  end

  test "should show salary_structure" do
    get :show, id: @salary_structure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_structure
    assert_response :success
  end

  test "should update salary_structure" do
    patch :update, id: @salary_structure, salary_structure: { basic: @salary_structure.basic, conveyance: @salary_structure.conveyance, da: @salary_structure.da, emp_pf: @salary_structure.emp_pf, gratuity: @salary_structure.gratuity, gross: @salary_structure.gross, hra: @salary_structure.hra, monthly_ctc: @salary_structure.monthly_ctc, name: @salary_structure.name, others: @salary_structure.others, pf: @salary_structure.pf, pt: @salary_structure.pt, special_allowance: @salary_structure.special_allowance }
    assert_redirected_to salary_structure_path(assigns(:salary_structure))
  end

  test "should destroy salary_structure" do
    assert_difference('SalaryStructure.count', -1) do
      delete :destroy, id: @salary_structure
    end

    assert_redirected_to salary_structures_path
  end
end
