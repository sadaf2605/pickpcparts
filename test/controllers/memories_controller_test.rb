require 'test_helper'

class MemoriesControllerTest < ActionController::TestCase
  setup do
    @memory = memories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create memory" do
    assert_difference('Memory.count') do
      post :create, memory: { cas: @memory.cas, color: @memory.color, ecc: @memory.ecc, heat: @memory.heat, manufacturer: @memory.manufacturer, part_no: @memory.part_no, price_gb: @memory.price_gb, registered: @memory.registered, size: @memory.size, speed: @memory.speed, spreader: @memory.spreader, voltage: @memory.voltage }
    end

    assert_redirected_to memory_path(assigns(:memory))
  end

  test "should show memory" do
    get :show, id: @memory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @memory
    assert_response :success
  end

  test "should update memory" do
    patch :update, id: @memory, memory: { cas: @memory.cas, color: @memory.color, ecc: @memory.ecc, heat: @memory.heat, manufacturer: @memory.manufacturer, part_no: @memory.part_no, price/gb: @memory.price/gb, registered: @memory.registered, size: @memory.size, speed: @memory.speed, spreader: @memory.spreader, voltage: @memory.voltage }
    assert_redirected_to memory_path(assigns(:memory))
  end

  test "should destroy memory" do
    assert_difference('Memory.count', -1) do
      delete :destroy, id: @memory
    end

    assert_redirected_to memories_path
  end
end
