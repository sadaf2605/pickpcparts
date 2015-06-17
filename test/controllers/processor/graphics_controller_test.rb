require 'test_helper'

class Processor::GraphicsControllerTest < ActionController::TestCase
  setup do
    @processor_graphic = processor_graphics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processor_graphics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processor_graphic" do
    assert_difference('Processor::Graphic.count') do
      post :create, processor_graphic: { clear_video_hd_technology: @processor_graphic.clear_video_hd_technology, graphics_base_frequency_in_MHz: @processor_graphic.graphics_base_frequency_in_MHz, graphics_max_dynamic_frequency_GHz: @processor_graphic.graphics_max_dynamic_frequency_GHz, graphics_video_max_memory_in_GB: @processor_graphic.graphics_video_max_memory_in_GB, processor_graphics: @processor_graphic.processor_graphics, quick_sync_video: @processor_graphic.quick_sync_video, wireless_display: @processor_graphic.wireless_display }
    end

    assert_redirected_to processor_graphic_path(assigns(:processor_graphic))
  end

  test "should show processor_graphic" do
    get :show, id: @processor_graphic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processor_graphic
    assert_response :success
  end

  test "should update processor_graphic" do
    patch :update, id: @processor_graphic, processor_graphic: { clear_video_hd_technology: @processor_graphic.clear_video_hd_technology, graphics_base_frequency_in_MHz: @processor_graphic.graphics_base_frequency_in_MHz, graphics_max_dynamic_frequency_GHz: @processor_graphic.graphics_max_dynamic_frequency_GHz, graphics_video_max_memory_in_GB: @processor_graphic.graphics_video_max_memory_in_GB, processor_graphics: @processor_graphic.processor_graphics, quick_sync_video: @processor_graphic.quick_sync_video, wireless_display: @processor_graphic.wireless_display }
    assert_redirected_to processor_graphic_path(assigns(:processor_graphic))
  end

  test "should destroy processor_graphic" do
    assert_difference('Processor::Graphic.count', -1) do
      delete :destroy, id: @processor_graphic
    end

    assert_redirected_to processor_graphics_path
  end
end
