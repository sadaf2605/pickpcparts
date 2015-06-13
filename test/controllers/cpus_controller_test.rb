require 'test_helper'

class CpusControllerTest < ActionController::TestCase
  setup do
    @cpu = cpus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cpus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cpu" do
    assert_difference('Cpu.count') do
      post :create, cpu: { cores: @cpu.cores, data_width: @cpu.data_width, hyper_threading: @cpu.hyper_threading, includes_cpu_cooler: @cpu.includes_cpu_cooler, integrated_graphics: @cpu.integrated_graphics, l1_cache: @cpu.l1_cache, l2_cache: @cpu.l2_cache, l3_cache: @cpu.l3_cache, lithography: @cpu.lithography, manufacturer: @cpu.manufacturer, model: @cpu.model, part_no: @cpu.part_no, speed: @cpu.speed, thermal_design_power: @cpu.thermal_design_power }
    end

    assert_redirected_to cpu_path(assigns(:cpu))
  end

  test "should show cpu" do
    get :show, id: @cpu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cpu
    assert_response :success
  end

  test "should update cpu" do
    patch :update, id: @cpu, cpu: { cores: @cpu.cores, data_width: @cpu.data_width, hyper_threading: @cpu.hyper_threading, includes_cpu_cooler: @cpu.includes_cpu_cooler, integrated_graphics: @cpu.integrated_graphics, l1_cache: @cpu.l1_cache, l2_cache: @cpu.l2_cache, l3_cache: @cpu.l3_cache, lithography: @cpu.lithography, manufacturer: @cpu.manufacturer, model: @cpu.model, part_no: @cpu.part_no, speed: @cpu.speed, thermal_design_power: @cpu.thermal_design_power }
    assert_redirected_to cpu_path(assigns(:cpu))
  end

  test "should destroy cpu" do
    assert_difference('Cpu.count', -1) do
      delete :destroy, id: @cpu
    end

    assert_redirected_to cpus_path
  end
end
