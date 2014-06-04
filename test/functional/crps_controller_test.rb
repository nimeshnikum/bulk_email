require 'test_helper'

class CrpsControllerTest < ActionController::TestCase
  setup do
    @crp = crps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crp" do
    assert_difference('Crp.count') do
      post :create, crp: { acd: @crp.acd, asr: @crp.asr, billing_increment: @crp.billing_increment, buy_lower_range: @crp.buy_lower_range, buy_upper_range: @crp.buy_upper_range, capacity: @crp.capacity, country_code: @crp.country_code, country_name: @crp.country_name, pdd: @crp.pdd, quality: @crp.quality, remarks: @crp.remarks, route_type: @crp.route_type, sell_lower_range: @crp.sell_lower_range, sell_upper_range: @crp.sell_upper_range, selling_rate: @crp.selling_rate, service_level: @crp.service_level, vendor1: @crp.vendor1, vendor2: @crp.vendor2, vendor3: @crp.vendor3, vendor4: @crp.vendor4 }
    end

    assert_redirected_to crp_path(assigns(:crp))
  end

  test "should show crp" do
    get :show, id: @crp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crp
    assert_response :success
  end

  test "should update crp" do
    put :update, id: @crp, crp: { acd: @crp.acd, asr: @crp.asr, billing_increment: @crp.billing_increment, buy_lower_range: @crp.buy_lower_range, buy_upper_range: @crp.buy_upper_range, capacity: @crp.capacity, country_code: @crp.country_code, country_name: @crp.country_name, pdd: @crp.pdd, quality: @crp.quality, remarks: @crp.remarks, route_type: @crp.route_type, sell_lower_range: @crp.sell_lower_range, sell_upper_range: @crp.sell_upper_range, selling_rate: @crp.selling_rate, service_level: @crp.service_level, vendor1: @crp.vendor1, vendor2: @crp.vendor2, vendor3: @crp.vendor3, vendor4: @crp.vendor4 }
    assert_redirected_to crp_path(assigns(:crp))
  end

  test "should destroy crp" do
    assert_difference('Crp.count', -1) do
      delete :destroy, id: @crp
    end

    assert_redirected_to crps_path
  end
end
