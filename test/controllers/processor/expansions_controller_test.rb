require 'test_helper'

class Processor::ExpansionsControllerTest < ActionController::TestCase
  setup do
    @processor_expansion = processor_expansions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processor_expansions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processor_expansion" do
    assert_difference('Processor::Expansion.count') do
      post :create, processor_expansion: { PCI_express_revision: @processor_expansion.PCI_express_revision, max_no_of_PCI_express_lanes: @processor_expansion.max_no_of_PCI_express_lanes }
    end

    assert_redirected_to processor_expansion_path(assigns(:processor_expansion))
  end

  test "should show processor_expansion" do
    get :show, id: @processor_expansion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processor_expansion
    assert_response :success
  end

  test "should update processor_expansion" do
    patch :update, id: @processor_expansion, processor_expansion: { PCI_express_revision: @processor_expansion.PCI_express_revision, max_no_of_PCI_express_lanes: @processor_expansion.max_no_of_PCI_express_lanes }
    assert_redirected_to processor_expansion_path(assigns(:processor_expansion))
  end

  test "should destroy processor_expansion" do
    assert_difference('Processor::Expansion.count', -1) do
      delete :destroy, id: @processor_expansion
    end

    assert_redirected_to processor_expansions_path
  end
end
