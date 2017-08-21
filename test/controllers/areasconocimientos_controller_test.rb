require 'test_helper'

class AreasconocimientosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get areasconocimientos_index_url
    assert_response :success
  end

  test "should get show" do
    get areasconocimientos_show_url
    assert_response :success
  end

  test "should get new" do
    get areasconocimientos_new_url
    assert_response :success
  end

  test "should get create" do
    get areasconocimientos_create_url
    assert_response :success
  end

  test "should get edit" do
    get areasconocimientos_edit_url
    assert_response :success
  end

  test "should get update" do
    get areasconocimientos_update_url
    assert_response :success
  end

end
