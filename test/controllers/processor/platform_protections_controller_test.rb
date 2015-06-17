require 'test_helper'

class Processor::PlatformProtectionsControllerTest < ActionController::TestCase
  setup do
    @processor_platform_protection = processor_platform_protections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processor_platform_protections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processor_platform_protection" do
    assert_difference('Processor::PlatformProtection.count') do
      post :create, processor_platform_protection: { execute_disable_bit: @processor_platform_protection.execute_disable_bit, trusted_execution_technology: @processor_platform_protection.trusted_execution_technology }
    end

    assert_redirected_to processor_platform_protection_path(assigns(:processor_platform_protection))
  end

  test "should show processor_platform_protection" do
    get :show, id: @processor_platform_protection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processor_platform_protection
    assert_response :success
  end

  test "should update processor_platform_protection" do
    patch :update, id: @processor_platform_protection, processor_platform_protection: { execute_disable_bit: @processor_platform_protection.execute_disable_bit, trusted_execution_technology: @processor_platform_protection.trusted_execution_technology }
    assert_redirected_to processor_platform_protection_path(assigns(:processor_platform_protection))
  end

  test "should destroy processor_platform_protection" do
    assert_difference('Processor::PlatformProtection.count', -1) do
      delete :destroy, id: @processor_platform_protection
    end

    assert_redirected_to processor_platform_protections_path
  end
end
