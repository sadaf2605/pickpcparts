require 'test_helper'

class PowerSuppliesControllerTest < ActionController::TestCase
  setup do
    @power_supply = power_supplies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:power_supplies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create power_supply" do
    assert_difference('PowerSupply.count') do
      post :create, power_supply: { efficiency: @power_supply.efficiency, efficiency_certification: @power_supply.efficiency_certification, fans: @power_supply.fans, manufacturer: @power_supply.manufacturer, modular: @power_supply.modular, output: @power_supply.output, part_no: @power_supply.part_no, pci_express_6_plus_2_pin_connectors: @power_supply.pci_express_6_plus_2_pin_connectors, type: @power_supply.type, wattage: @power_supply.wattage }
    end

    assert_redirected_to power_supply_path(assigns(:power_supply))
  end

  test "should show power_supply" do
    get :show, id: @power_supply
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @power_supply
    assert_response :success
  end

  test "should update power_supply" do
    patch :update, id: @power_supply, power_supply: { efficiency: @power_supply.efficiency, efficiency_certification: @power_supply.efficiency_certification, fans: @power_supply.fans, manufacturer: @power_supply.manufacturer, modular: @power_supply.modular, output: @power_supply.output, part_no: @power_supply.part_no, pci_express_6_plus_2_pin_connectors: @power_supply.pci_express_6_plus_2_pin_connectors, type: @power_supply.type, wattage: @power_supply.wattage }
    assert_redirected_to power_supply_path(assigns(:power_supply))
  end

  test "should destroy power_supply" do
    assert_difference('PowerSupply.count', -1) do
      delete :destroy, id: @power_supply
    end

    assert_redirected_to power_supplies_path
  end
end
