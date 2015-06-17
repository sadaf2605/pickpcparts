require 'test_helper'

class Processor::PerformancesControllerTest < ActionController::TestCase
  setup do
    @processor_performance = processor_performances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processor_performances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processor_performance" do
    assert_difference('Processor::Performance.count') do
      post :create, processor_performance: { no_of_cores: @processor_performance.no_of_cores, no_of_threads: @processor_performance.no_of_threads, processor_base_frequency_in_GHz: @processor_performance.processor_base_frequency_in_GHz, thermal_design_power_in_W: @processor_performance.thermal_design_power_in_W }
    end

    assert_redirected_to processor_performance_path(assigns(:processor_performance))
  end

  test "should show processor_performance" do
    get :show, id: @processor_performance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processor_performance
    assert_response :success
  end

  test "should update processor_performance" do
    patch :update, id: @processor_performance, processor_performance: { no_of_cores: @processor_performance.no_of_cores, no_of_threads: @processor_performance.no_of_threads, processor_base_frequency_in_GHz: @processor_performance.processor_base_frequency_in_GHz, thermal_design_power_in_W: @processor_performance.thermal_design_power_in_W }
    assert_redirected_to processor_performance_path(assigns(:processor_performance))
  end

  test "should destroy processor_performance" do
    assert_difference('Processor::Performance.count', -1) do
      delete :destroy, id: @processor_performance
    end

    assert_redirected_to processor_performances_path
  end
end
