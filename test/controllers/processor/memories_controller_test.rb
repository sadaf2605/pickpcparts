require 'test_helper'

class Processor::MemoriesControllerTest < ActionController::TestCase
  setup do
    @processor_memory = processor_memories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processor_memories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processor_memory" do
    assert_difference('Processor::Memory.count') do
      post :create, processor_memory: { ecc_memory_supported: @processor_memory.ecc_memory_supported, max_memory_bandwidth_in_GBs: @processor_memory.max_memory_bandwidth_in_GBs, max_memory_size_GB: @processor_memory.max_memory_size_GB, max_no_of_memory_channels: @processor_memory.max_no_of_memory_channels }
    end

    assert_redirected_to processor_memory_path(assigns(:processor_memory))
  end

  test "should show processor_memory" do
    get :show, id: @processor_memory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processor_memory
    assert_response :success
  end

  test "should update processor_memory" do
    patch :update, id: @processor_memory, processor_memory: { ecc_memory_supported: @processor_memory.ecc_memory_supported, max_memory_bandwidth_in_GBs: @processor_memory.max_memory_bandwidth_in_GBs, max_memory_size_GB: @processor_memory.max_memory_size_GB, max_no_of_memory_channels: @processor_memory.max_no_of_memory_channels }
    assert_redirected_to processor_memory_path(assigns(:processor_memory))
  end

  test "should destroy processor_memory" do
    assert_difference('Processor::Memory.count', -1) do
      delete :destroy, id: @processor_memory
    end

    assert_redirected_to processor_memories_path
  end
end
