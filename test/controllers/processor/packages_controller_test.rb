require 'test_helper'

class Processor::PackagesControllerTest < ActionController::TestCase
  setup do
    @processor_package = processor_packages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processor_packages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processor_package" do
    assert_difference('Processor::Package.count') do
      post :create, processor_package: { TCASE_in_C: @processor_package.TCASE_in_C, graphics_and_imc_lithography_in_nm: @processor_package.graphics_and_imc_lithography_in_nm, low_halogen_options_available: @processor_package.low_halogen_options_available, max_cpu_configuration: @processor_package.max_cpu_configuration, package_length_in_mn: @processor_package.package_length_in_mn, package_width_in_mn: @processor_package.package_width_in_mn }
    end

    assert_redirected_to processor_package_path(assigns(:processor_package))
  end

  test "should show processor_package" do
    get :show, id: @processor_package
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processor_package
    assert_response :success
  end

  test "should update processor_package" do
    patch :update, id: @processor_package, processor_package: { TCASE_in_C: @processor_package.TCASE_in_C, graphics_and_imc_lithography_in_nm: @processor_package.graphics_and_imc_lithography_in_nm, low_halogen_options_available: @processor_package.low_halogen_options_available, max_cpu_configuration: @processor_package.max_cpu_configuration, package_length_in_mn: @processor_package.package_length_in_mn, package_width_in_mn: @processor_package.package_width_in_mn }
    assert_redirected_to processor_package_path(assigns(:processor_package))
  end

  test "should destroy processor_package" do
    assert_difference('Processor::Package.count', -1) do
      delete :destroy, id: @processor_package
    end

    assert_redirected_to processor_packages_path
  end
end
