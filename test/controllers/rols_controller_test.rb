require 'test_helper'

class RolsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get rols_list_url
    assert_response :success
  end

  test "should get show" do
    get rols_show_url
    assert_response :success
  end

  test "should get new" do
    get rols_new_url
    assert_response :success
  end

  test "should get create" do
    get rols_create_url
    assert_response :success
  end

  test "should get edit" do
    get rols_edit_url
    assert_response :success
  end

  test "should get update" do
    get rols_update_url
    assert_response :success
  end

  test "should get delete" do
    get rols_delete_url
    assert_response :success
  end

end
