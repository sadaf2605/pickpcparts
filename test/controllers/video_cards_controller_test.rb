require 'test_helper'

class VideoCardsControllerTest < ActionController::TestCase
  setup do
    @video_card = video_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:video_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video_card" do
    assert_difference('VideoCard.count') do
      post :create, video_card: { chipset: @video_card.chipset, core_clock: @video_card.core_clock, crossfire_support: @video_card.crossfire_support, display_port: @video_card.display_port, dvi_d_dual_link: @video_card.dvi_d_dual_link, fan: @video_card.fan, hdmi: @video_card.hdmi, interface: @video_card.interface, length: @video_card.length, manufacturer: @video_card.manufacturer, memory_size: @video_card.memory_size, memory_type: @video_card.memory_type, part_no: @video_card.part_no, sli_support: @video_card.sli_support, tdp: @video_card.tdp }
    end

    assert_redirected_to video_card_path(assigns(:video_card))
  end

  test "should show video_card" do
    get :show, id: @video_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @video_card
    assert_response :success
  end

  test "should update video_card" do
    patch :update, id: @video_card, video_card: { chipset: @video_card.chipset, core_clock: @video_card.core_clock, crossfire_support: @video_card.crossfire_support, display_port: @video_card.display_port, dvi_d_dual_link: @video_card.dvi_d_dual_link, fan: @video_card.fan, hdmi: @video_card.hdmi, interface: @video_card.interface, length: @video_card.length, manufacturer: @video_card.manufacturer, memory_size: @video_card.memory_size, memory_type: @video_card.memory_type, part_no: @video_card.part_no, sli_support: @video_card.sli_support, tdp: @video_card.tdp }
    assert_redirected_to video_card_path(assigns(:video_card))
  end

  test "should destroy video_card" do
    assert_difference('VideoCard.count', -1) do
      delete :destroy, id: @video_card
    end

    assert_redirected_to video_cards_path
  end
end
