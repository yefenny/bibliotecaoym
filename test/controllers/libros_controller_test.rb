require 'test_helper'

class LibrosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get libros_index_url
    assert_response :success
  end

  test "should get show" do
    get libros_show_url
    assert_response :success
  end

  test "should get new" do
    get libros_new_url
    assert_response :success
  end

  test "should get create" do
    get libros_create_url
    assert_response :success
  end

  test "should get edit" do
    get libros_edit_url
    assert_response :success
  end

  test "should get update" do
    get libros_update_url
    assert_response :success
  end

  test "should get destroy" do
    get libros_destroy_url
    assert_response :success
  end

end
