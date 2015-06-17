require 'test_helper'

class Processor::ProcessorsControllerTest < ActionController::TestCase
  setup do
    @processor_processor = processor_processors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processor_processors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processor_processor" do
    assert_difference('Processor::Processor.count') do
      post :create, processor_processor: { DMI2_in_GTs: @processor_processor.DMI2_in_GTs, cache_in_MB: @processor_processor.cache_in_MB, embedded_options_available: @processor_processor.embedded_options_available, instruction_set_extensions: @processor_processor.instruction_set_extensions, instruction_set_in_bit: @processor_processor.instruction_set_in_bit, lithography_in_nm: @processor_processor.lithography_in_nm, processor_number: @processor_processor.processor_number, scalability: @processor_processor.scalability }
    end

    assert_redirected_to processor_processor_path(assigns(:processor_processor))
  end

  test "should show processor_processor" do
    get :show, id: @processor_processor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processor_processor
    assert_response :success
  end

  test "should update processor_processor" do
    patch :update, id: @processor_processor, processor_processor: { DMI2_in_GTs: @processor_processor.DMI2_in_GTs, cache_in_MB: @processor_processor.cache_in_MB, embedded_options_available: @processor_processor.embedded_options_available, instruction_set_extensions: @processor_processor.instruction_set_extensions, instruction_set_in_bit: @processor_processor.instruction_set_in_bit, lithography_in_nm: @processor_processor.lithography_in_nm, processor_number: @processor_processor.processor_number, scalability: @processor_processor.scalability }
    assert_redirected_to processor_processor_path(assigns(:processor_processor))
  end

  test "should destroy processor_processor" do
    assert_difference('Processor::Processor.count', -1) do
      delete :destroy, id: @processor_processor
    end

    assert_redirected_to processor_processors_path
  end
end
