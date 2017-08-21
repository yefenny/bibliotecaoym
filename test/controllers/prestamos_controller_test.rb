require 'test_helper'

class PrestamosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prestamos_index_url
    assert_response :success
  end

  test "should get show" do
    get prestamos_show_url
    assert_response :success
  end

  test "should get new" do
    get prestamos_new_url
    assert_response :success
  end

  test "should get create" do
    get prestamos_create_url
    assert_response :success
  end

  test "should get edit" do
    get prestamos_edit_url
    assert_response :success
  end

  test "should get update" do
    get prestamos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get prestamos_destroy_url
    assert_response :success
  end

end
