require 'test_helper'

class TopRoutesControllerTest < ActionController::TestCase
  setup do
    @top_route = top_routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:top_routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create top_route" do
    assert_difference('TopRoute.count') do
      post :create, top_route: { acd: @top_route.acd, asr: @top_route.asr, capacity: @top_route.capacity, country_code: @top_route.country_code, country_name: @top_route.country_name, quality: @top_route.quality, remarks: @top_route.remarks, select_for_promotion: @top_route.select_for_promotion, selling_rate: @top_route.selling_rate, service_level: @top_route.service_level }
    end

    assert_redirected_to top_route_path(assigns(:top_route))
  end

  test "should show top_route" do
    get :show, id: @top_route
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @top_route
    assert_response :success
  end

  test "should update top_route" do
    put :update, id: @top_route, top_route: { acd: @top_route.acd, asr: @top_route.asr, capacity: @top_route.capacity, country_code: @top_route.country_code, country_name: @top_route.country_name, quality: @top_route.quality, remarks: @top_route.remarks, select_for_promotion: @top_route.select_for_promotion, selling_rate: @top_route.selling_rate, service_level: @top_route.service_level }
    assert_redirected_to top_route_path(assigns(:top_route))
  end

  test "should destroy top_route" do
    assert_difference('TopRoute.count', -1) do
      delete :destroy, id: @top_route
    end

    assert_redirected_to top_routes_path
  end
end
