require 'test_helper'

class AsignaturasControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get asignaturas_list_url
    assert_response :success
  end

  test "should get show" do
    get asignaturas_show_url
    assert_response :success
  end

  test "should get new" do
    get asignaturas_new_url
    assert_response :success
  end

  test "should get create" do
    get asignaturas_create_url
    assert_response :success
  end

  test "should get edit" do
    get asignaturas_edit_url
    assert_response :success
  end

  test "should get update" do
    get asignaturas_update_url
    assert_response :success
  end

end
