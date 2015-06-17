require 'test_helper'

class Processor::ProcessorPackagesControllerTest < ActionController::TestCase
  setup do
    @processor_processor_package = processor_processor_packages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processor_processor_packages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processor_processor_package" do
    assert_difference('Processor::ProcessorPackage.count') do
      post :create, processor_processor_package: { TCASE_in_C: @processor_processor_package.TCASE_in_C, graphics_and_imc_lithography_in_nm: @processor_processor_package.graphics_and_imc_lithography_in_nm, low_halogen_options_available: @processor_processor_package.low_halogen_options_available, max_cpu_configuration: @processor_processor_package.max_cpu_configuration, package_length_in_mn: @processor_processor_package.package_length_in_mn, package_width_in_mn: @processor_processor_package.package_width_in_mn }
    end

    assert_redirected_to processor_processor_package_path(assigns(:processor_processor_package))
  end

  test "should show processor_processor_package" do
    get :show, id: @processor_processor_package
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processor_processor_package
    assert_response :success
  end

  test "should update processor_processor_package" do
    patch :update, id: @processor_processor_package, processor_processor_package: { TCASE_in_C: @processor_processor_package.TCASE_in_C, graphics_and_imc_lithography_in_nm: @processor_processor_package.graphics_and_imc_lithography_in_nm, low_halogen_options_available: @processor_processor_package.low_halogen_options_available, max_cpu_configuration: @processor_processor_package.max_cpu_configuration, package_length_in_mn: @processor_processor_package.package_length_in_mn, package_width_in_mn: @processor_processor_package.package_width_in_mn }
    assert_redirected_to processor_processor_package_path(assigns(:processor_processor_package))
  end

  test "should destroy processor_processor_package" do
    assert_difference('Processor::ProcessorPackage.count', -1) do
      delete :destroy, id: @processor_processor_package
    end

    assert_redirected_to processor_processor_packages_path
  end
end
