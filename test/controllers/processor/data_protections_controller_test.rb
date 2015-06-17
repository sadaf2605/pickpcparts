require 'test_helper'

class Processor::DataProtectionsControllerTest < ActionController::TestCase
  setup do
    @processor_data_protection = processor_data_protections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processor_data_protections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processor_data_protection" do
    assert_difference('Processor::DataProtection.count') do
      post :create, processor_data_protection: { AES_new_nstructions: @processor_data_protection.AES_new_nstructions, secure_key: @processor_data_protection.secure_key }
    end

    assert_redirected_to processor_data_protection_path(assigns(:processor_data_protection))
  end

  test "should show processor_data_protection" do
    get :show, id: @processor_data_protection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processor_data_protection
    assert_response :success
  end

  test "should update processor_data_protection" do
    patch :update, id: @processor_data_protection, processor_data_protection: { AES_new_nstructions: @processor_data_protection.AES_new_nstructions, secure_key: @processor_data_protection.secure_key }
    assert_redirected_to processor_data_protection_path(assigns(:processor_data_protection))
  end

  test "should destroy processor_data_protection" do
    assert_difference('Processor::DataProtection.count', -1) do
      delete :destroy, id: @processor_data_protection
    end

    assert_redirected_to processor_data_protections_path
  end
end
