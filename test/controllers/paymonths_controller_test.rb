require 'test_helper'

class PaymonthsControllerTest < ActionController::TestCase
  setup do
    @paymonth = paymonths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paymonths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paymonth" do
    assert_difference('Paymonth.count') do
      post :create, paymonth: { day_count: @paymonth.day_count, month_name: @paymonth.month_name, month_year: @paymonth.month_year, pay_month: @paymonth.pay_month }
    end

    assert_redirected_to paymonth_path(assigns(:paymonth))
  end

  test "should show paymonth" do
    get :show, id: @paymonth
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paymonth
    assert_response :success
  end

  test "should update paymonth" do
    patch :update, id: @paymonth, paymonth: { day_count: @paymonth.day_count, month_name: @paymonth.month_name, month_year: @paymonth.month_year, pay_month: @paymonth.pay_month }
    assert_redirected_to paymonth_path(assigns(:paymonth))
  end

  test "should destroy paymonth" do
    assert_difference('Paymonth.count', -1) do
      delete :destroy, id: @paymonth
    end

    assert_redirected_to paymonths_path
  end
end
