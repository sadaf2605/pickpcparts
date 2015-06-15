require 'test_helper'

class StoragesControllerTest < ActionController::TestCase
  setup do
    @storage = storages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storage" do
    assert_difference('Storage.count') do
      post :create, storage: { cache: @storage.cache, capacity: @storage.capacity, form_factor: @storage.form_factor, gb_1: @storage.gb_1, interface: @storage.interface, manufacturer: @storage.manufacturer, nand_flash_type: @storage.nand_flash_type, part_no: @storage.part_no, price_gb: @storage.price_gb, ssd_controller: @storage.ssd_controller }
    end

    assert_redirected_to storage_path(assigns(:storage))
  end

  test "should show storage" do
    get :show, id: @storage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @storage
    assert_response :success
  end

  test "should update storage" do
    patch :update, id: @storage, storage: { cache: @storage.cache, capacity: @storage.capacity, form_factor: @storage.form_factor, gb_1: @storage.gb_1, interface: @storage.interface, manufacturer: @storage.manufacturer, nand_flash_type: @storage.nand_flash_type, part_no: @storage.part_no, price_gb: @storage.price_gb, ssd_controller: @storage.ssd_controller }
    assert_redirected_to storage_path(assigns(:storage))
  end

  test "should destroy storage" do
    assert_difference('Storage.count', -1) do
      delete :destroy, id: @storage
    end

    assert_redirected_to storages_path
  end
end
