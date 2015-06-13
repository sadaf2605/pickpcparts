require 'test_helper'

class MotherboardsControllerTest < ActionController::TestCase
  setup do
    @motherboard = motherboards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motherboards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motherboard" do
    assert_difference('Motherboard.count') do
      post :create, motherboard: { chipset: @motherboard.chipset, crossfire_support: @motherboard.crossfire_support, form_factor: @motherboard.form_factor, manufacturer: @motherboard.manufacturer, max_memory: @motherboard.max_memory, memory_slots: @motherboard.memory_slots, memory_type: @motherboard.memory_type, onboard_ethernet: @motherboard.onboard_ethernet, onboard_usb_3_headers: @motherboard.onboard_usb_3_headers, onboard_video: @motherboard.onboard_video, part_no: @motherboard.part_no, raid_support: @motherboard.raid_support, sata_6_gbs: @motherboard.sata_6_gbs, sli_support: @motherboard.sli_support }
    end

    assert_redirected_to motherboard_path(assigns(:motherboard))
  end

  test "should show motherboard" do
    get :show, id: @motherboard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @motherboard
    assert_response :success
  end

  test "should update motherboard" do
    patch :update, id: @motherboard, motherboard: { chipset: @motherboard.chipset, crossfire_support: @motherboard.crossfire_support, form_factor: @motherboard.form_factor, manufacturer: @motherboard.manufacturer, max_memory: @motherboard.max_memory, memory_slots: @motherboard.memory_slots, memory_type: @motherboard.memory_type, onboard_ethernet: @motherboard.onboard_ethernet, onboard_usb_3_headers: @motherboard.onboard_usb_3_headers, onboard_video: @motherboard.onboard_video, part_no: @motherboard.part_no, raid_support: @motherboard.raid_support, sata_6_gbs: @motherboard.sata_6_gbs, sli_support: @motherboard.sli_support }
    assert_redirected_to motherboard_path(assigns(:motherboard))
  end

  test "should destroy motherboard" do
    assert_difference('Motherboard.count', -1) do
      delete :destroy, id: @motherboard
    end

    assert_redirected_to motherboards_path
  end
end
