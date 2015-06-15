require 'test_helper'

class CpuCasesControllerTest < ActionController::TestCase
  setup do
    @cpu_case = cpu_cases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cpu_cases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cpu_case" do
    assert_difference('CpuCase.count') do
      post :create, cpu_case: { color: @cpu_case.color, dimensions: @cpu_case.dimensions, external_5_25_bays: @cpu_case.external_5_25_bays, front_panel_usb_3_0: @cpu_case.front_panel_usb_3_0, includes_power_supply: @cpu_case.includes_power_supply, internal_2_5_bays: @cpu_case.internal_2_5_bays, internal_3_5_bays: @cpu_case.internal_3_5_bays, manufacturer: @cpu_case.manufacturer, maximum_video_card_length: @cpu_case.maximum_video_card_length, motherboard_compatibility: @cpu_case.motherboard_compatibility, part_no: @cpu_case.part_no, ports: @cpu_case.ports, type: @cpu_case.type }
    end

    assert_redirected_to cpu_case_path(assigns(:cpu_case))
  end

  test "should show cpu_case" do
    get :show, id: @cpu_case
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cpu_case
    assert_response :success
  end

  test "should update cpu_case" do
    patch :update, id: @cpu_case, cpu_case: { color: @cpu_case.color, dimensions: @cpu_case.dimensions, external_5_25_bays: @cpu_case.external_5_25_bays, front_panel_usb_3_0: @cpu_case.front_panel_usb_3_0, includes_power_supply: @cpu_case.includes_power_supply, internal_2_5_bays: @cpu_case.internal_2_5_bays, internal_3_5_bays: @cpu_case.internal_3_5_bays, manufacturer: @cpu_case.manufacturer, maximum_video_card_length: @cpu_case.maximum_video_card_length, motherboard_compatibility: @cpu_case.motherboard_compatibility, part_no: @cpu_case.part_no, ports: @cpu_case.ports, type: @cpu_case.type }
    assert_redirected_to cpu_case_path(assigns(:cpu_case))
  end

  test "should destroy cpu_case" do
    assert_difference('CpuCase.count', -1) do
      delete :destroy, id: @cpu_case
    end

    assert_redirected_to cpu_cases_path
  end
end
