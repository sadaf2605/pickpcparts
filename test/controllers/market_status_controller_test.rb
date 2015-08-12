require 'test_helper'

class MarketStatusControllerTest < ActionController::TestCase
  test "should get shop_id:integer" do
    get :shop_id:integer
    assert_response :success
  end

  test "should get product_id:integer" do
    get :product_id:integer
    assert_response :success
  end

  test "should get price:float" do
    get :price:float
    assert_response :success
  end

end
