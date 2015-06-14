require 'test_helper'

class MemorySlotsControllerTest < ActionController::TestCase
  setup do
    @memory_slot = memory_slots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memory_slots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create memory_slot" do
    assert_difference('MemorySlot.count') do
      post :create, memory_slot: { name: @memory_slot.name }
    end

    assert_redirected_to memory_slot_path(assigns(:memory_slot))
  end

  test "should show memory_slot" do
    get :show, id: @memory_slot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @memory_slot
    assert_response :success
  end

  test "should update memory_slot" do
    patch :update, id: @memory_slot, memory_slot: { name: @memory_slot.name }
    assert_redirected_to memory_slot_path(assigns(:memory_slot))
  end

  test "should destroy memory_slot" do
    assert_difference('MemorySlot.count', -1) do
      delete :destroy, id: @memory_slot
    end

    assert_redirected_to memory_slots_path
  end
end
