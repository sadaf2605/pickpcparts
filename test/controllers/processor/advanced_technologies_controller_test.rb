require 'test_helper'

class Processor::AdvancedTechnologiesControllerTest < ActionController::TestCase
  setup do
    @processor_advanced_technology = processor_advanced_technologies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processor_advanced_technologies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processor_advanced_technology" do
    assert_difference('Processor::AdvancedTechnology.count') do
      post :create, processor_advanced_technology: { TSX_NI: @processor_advanced_technology.TSX_NI, enhanced_speedstep_technology: @processor_advanced_technology.enhanced_speedstep_technology, hyper_threading_technology: @processor_advanced_technology.hyper_threading_technology, idle_states: @processor_advanced_technology.idle_states, intel_64: @processor_advanced_technology.intel_64, stable_image_platform_program_SIPP: @processor_advanced_technology.stable_image_platform_program_SIPP, thermal_monitoring_technologies: @processor_advanced_technology.thermal_monitoring_technologies, turbo_boost_technology: @processor_advanced_technology.turbo_boost_technology, vPro_technology: @processor_advanced_technology.vPro_technology, virtualization_technology_for_directed_IO_vtd: @processor_advanced_technology.virtualization_technology_for_directed_IO_vtd, virtualization_technology_for_itanium_vti: @processor_advanced_technology.virtualization_technology_for_itanium_vti, virtualization_technology_vtx: @processor_advanced_technology.virtualization_technology_vtx, vtx_with_extended_page_tables_ept: @processor_advanced_technology.vtx_with_extended_page_tables_ept }
    end

    assert_redirected_to processor_advanced_technology_path(assigns(:processor_advanced_technology))
  end

  test "should show processor_advanced_technology" do
    get :show, id: @processor_advanced_technology
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processor_advanced_technology
    assert_response :success
  end

  test "should update processor_advanced_technology" do
    patch :update, id: @processor_advanced_technology, processor_advanced_technology: { TSX_NI: @processor_advanced_technology.TSX_NI, enhanced_speedstep_technology: @processor_advanced_technology.enhanced_speedstep_technology, hyper_threading_technology: @processor_advanced_technology.hyper_threading_technology, idle_states: @processor_advanced_technology.idle_states, intel_64: @processor_advanced_technology.intel_64, stable_image_platform_program_SIPP: @processor_advanced_technology.stable_image_platform_program_SIPP, thermal_monitoring_technologies: @processor_advanced_technology.thermal_monitoring_technologies, turbo_boost_technology: @processor_advanced_technology.turbo_boost_technology, vPro_technology: @processor_advanced_technology.vPro_technology, virtualization_technology_for_directed_IO_vtd: @processor_advanced_technology.virtualization_technology_for_directed_IO_vtd, virtualization_technology_for_itanium_vti: @processor_advanced_technology.virtualization_technology_for_itanium_vti, virtualization_technology_vtx: @processor_advanced_technology.virtualization_technology_vtx, vtx_with_extended_page_tables_ept: @processor_advanced_technology.vtx_with_extended_page_tables_ept }
    assert_redirected_to processor_advanced_technology_path(assigns(:processor_advanced_technology))
  end

  test "should destroy processor_advanced_technology" do
    assert_difference('Processor::AdvancedTechnology.count', -1) do
      delete :destroy, id: @processor_advanced_technology
    end

    assert_redirected_to processor_advanced_technologies_path
  end
end
