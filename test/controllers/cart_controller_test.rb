require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cart_show_url
    assert_response :success
  end

  test "should get add_item" do
    get cart_add_item_url
    assert_response :success
  end

  test "should get update_item" do
    get cart_update_item_url
    assert_response :success
  end

  test "should get delete_item" do
    get cart_delete_item_url
    assert_response :success
  end

end
