require 'test_helper'

class FormFactorsControllerTest < ActionController::TestCase
  setup do
    @form_factor = form_factors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_factor" do
    assert_difference('FormFactor.count') do
      post :create, form_factor: { string: @form_factor.string }
    end

    assert_redirected_to form_factor_path(assigns(:form_factor))
  end

  test "should show form_factor" do
    get :show, id: @form_factor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_factor
    assert_response :success
  end

  test "should update form_factor" do
    patch :update, id: @form_factor, form_factor: { string: @form_factor.string }
    assert_redirected_to form_factor_path(assigns(:form_factor))
  end

  test "should destroy form_factor" do
    assert_difference('FormFactor.count', -1) do
      delete :destroy, id: @form_factor
    end

    assert_redirected_to form_factors_path
  end
end
